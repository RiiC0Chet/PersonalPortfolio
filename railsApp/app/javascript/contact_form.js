document.addEventListener("DOMContentLoaded", function() {
  const projectsBtn = document.getElementById('projectsBtn');
  const homeBtn = document.getElementById('homeBtn');
  const infoBtn = document.getElementById('infoBtn');
  const contactBtn = document.getElementById('contactBtn');
  const APItBtn = document.getElementById('APIBtn');

  const projectsSection = document.getElementById('projects');
  const introSection = document.getElementById('intro');
  const infoSection = document.getElementById('info');
  const contactSection = document.getElementById('contact');
  const apiSection = document.getElementById('api');

  const buttons = [homeBtn, projectsBtn, infoBtn, contactBtn,APItBtn];
  const sections = [introSection, projectsSection, infoSection, contactSection,apiSection];

  function activateSection(index) {
    // Ocultar todas las secciones
    sections.forEach(section => section.classList.add("hidden"));
    
    // Mostrar la sección activa
    sections[index].classList.remove("hidden");

    // Eliminar la clase activa de todos los botones
    buttons.forEach(button => button.classList.remove("active"));

    // Agregar la clase activa al botón correspondiente
    buttons[index].classList.add("active");
  }

  // Agregar eventos a los botones
  homeBtn.addEventListener("click", function() {
    activateSection(0); // Activa Home
  });

  projectsBtn.addEventListener("click", function() {
    activateSection(1); // Activa Projects
  });

  infoBtn.addEventListener("click", function() {
    activateSection(2); // Activa Info
  });

  contactBtn.addEventListener("click", function() {
    activateSection(3); // Activa Contact
  });

  APItBtn.addEventListener("click", function() {
    activateSection(4); // Activa Contact
  });
});
