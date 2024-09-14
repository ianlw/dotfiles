from selenium import webdriver
from PIL import Image
from selenium.webdriver.common.by import By
import base64
import pytesseract
import time
from selenium.common.exceptions import NoSuchElementException

options = webdriver.ChromeOptions()
options.add_experimental_option("detach", True)

MAX_ATTEMPTS = 2  # Número máximo de intentos para reconocer el CAPTCHA

while True:  # Bucle exterior para ejecutar continuamente el programa
    try:
        attempt = 0  # Inicializar el contador de intentos

        driver = webdriver.Chrome(options=options)
        driver.get("http://bienestar.unsaac.edu.pe/")
        
        # Recargar la página dos veces al inicio de cada iteración
        driver.refresh()
        time.sleep(0.5)  # Esperar un momento para que la página se recargue
        driver.refresh()
        time.sleep(0.5)  # Esperar nuevamente para la segunda recarga

        while attempt < MAX_ATTEMPTS:
            try:
                driver.find_element(By.XPATH, '//*[@id="codigo"]').send_keys('211359')
                driver.find_element(By.XPATH, '//*[@id="pass"]').send_keys('25771')

                try:
                    captchaImage = driver.find_element(By.XPATH, '//*[@id="imgcap"]')
                except NoSuchElementException:
                    print("Captcha no encontrado.")
                    attempt += 1
                    continue

                captchaImageSave = driver.execute_async_script("""
                    var ele = arguments[0], callback = arguments[1];
                    ele.addEventListener('load', function fn(){
                        ele.removeEventListener('load', fn, false);
                        var cnv = document.createElement('canvas');
                        cnv.width = this.width; cnv.height = this.height;
                        cnv.getContext('2d').drawImage(this, 0, 0);
                        callback(cnv.toDataURL('image/jpeg').substring(22));
                    }, false);
                    ele.dispatchEvent(new Event('load'));
                """, captchaImage)

                with open(r"captcha.jpg", 'wb') as f:
                    f.write(base64.b64decode(captchaImageSave))

                image = Image.open('captcha.jpg')
                texto_captcha = pytesseract.image_to_string(image)
                print(f"Texto del captcha: {texto_captcha}")

                if texto_captcha:
                    driver.find_element(By.XPATH, '//*[@id="cap"]').send_keys(texto_captcha)
                    driver.find_element(By.XPATH, '//*[@id="bnReserva"]').click()

                    # Esperar un momento para asegurarse de que la página cargue completamente
                    time.sleep(1)
                    driver.back()
                    driver.forward()
                    attempt = 0  # Reiniciar el contador de intentos si se tiene éxito

                else:
                    print("Error al reconocer CAPTCHA. Retrying...")
                    time.sleep(1)
                    attempt += 1

            except Exception as e:
                print("Error:", e)
                print("Reintentando...")
                time.sleep(1)
                attempt += 1

        print("Número máximo de intentos alcanzado. Reiniciando el proceso...")

        # Cerrar la ventana del navegador antes de iniciar una nueva iteración
        driver.quit()

    except Exception as e:
        print("Error:", e)
        print("Reintentando...")
        time.sleep(1)
        driver.quit()
