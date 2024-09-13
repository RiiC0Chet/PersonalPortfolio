
document.addEventListener('DOMContentLoaded', function() {
    var contactFormTitle = document.querySelector('.section-title-contact');
    var contactFormContainer = document.getElementById('contact-form-container');
    var toggleIcon = document.querySelector('.toggle-icon');
  
    if (contactFormTitle && contactFormContainer && toggleIcon) {
      contactFormTitle.addEventListener('click', function() {
        if (contactFormContainer.style.display === 'none' || contactFormContainer.style.display === '') {
          contactFormContainer.style.display = 'block';
          toggleIcon.textContent = '-'; // Cambiar el signo a "-"
        } else {
          contactFormContainer.style.display = 'none';
          toggleIcon.textContent = '+'; // Cambiar el signo a "+"
        }
      });
    }
  });

  document.addEventListener("DOMContentLoaded", function() {
    // Selecciona el enlace del botón "Contacto"
    const contactButton = document.querySelector(".nav-button[href*='#contact-form']");
  
    
  
    // Función para manejar el desplazamiento y mostrar el formulario
    function handleScrollToContactForm() {

      const contactForm = document.getElementById("contact-form-container");
      contactForm.style.display = "block";
      // Muestra el formulario de contacto después de un pequeño retraso
      setTimeout(function() {
        
        // Desplaza la página hasta el formulario de contacto
        contactForm.scrollIntoView({ behavior: "smooth" });
      }, 500); // Espera 500ms para asegurarte de que el desplazamiento haya terminado
    }
  
    // Añade un evento de clic al botón "Contacto"
    contactButton.addEventListener("click", function(event) {
      event.preventDefault(); // Previene la acción predeterminada del enlace
  
      // Redirige a la página root con el ancla del formulario de contacto
      window.location.href = root_path + "#contact-form";
  
      // Maneja el desplazamiento y muestra el formulario
      handleScrollToContactForm();
    });
  
    // Verifica si la página se ha cargado con un ancla específica
    if (window.location.hash === "#contact-form") {
      // Maneja el desplazamiento y muestra el formulario
      handleScrollToContactForm();
    }
  });