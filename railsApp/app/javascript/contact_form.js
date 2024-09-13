
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

    const contactButton = document.querySelector(".nav-button[href*='#contact-form']");

      contactButton.addEventListener("click", function(event) {
        const contactForm = document.getElementById("contact-form-container");
        const footer = document.querySelector(".site-footer");
        event.preventDefault(); 
        console.log(contactForm);
        contactForm.style.display = "block";
        
        setTimeout(function() {
          footer.scrollIntoView({ behavior: "smooth" });
        }, 500);

      });
  });