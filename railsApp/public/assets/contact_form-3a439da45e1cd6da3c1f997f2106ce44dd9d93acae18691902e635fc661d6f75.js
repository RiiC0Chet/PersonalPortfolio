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
  const projectDetailsSection = document.getElementById('project-details');

  const buttons = [homeBtn, projectsBtn, infoBtn, contactBtn,APItBtn];
  const sections = [introSection, projectsSection, infoSection, contactSection,apiSection,projectDetailsSection];

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

  // Mostrar la sección de la API si hay datos disponibles
  if (apiSection && !apiSection.classList.contains('hidden')) {
    activateSection(4);
  }

  // Manejar el envío del formulario
  const weatherForm = document.getElementById('weather-form');
  weatherForm.addEventListener('submit', function(event) {
    event.preventDefault();
    const latitude = document.querySelector('input[name="latitude"]').value;
    const longitude = document.querySelector('input[name="longitude"]').value;
    const url = new URL(window.location.href);
    url.searchParams.set('latitude', latitude);
    url.searchParams.set('longitude', longitude);
    url.searchParams.set('section', 'api');
    window.location.href = url.toString();
  });

  // Mostrar la sección de la API si el parámetro 'section' está presente en la URL
  const urlParams = new URLSearchParams(window.location.search);
  if (urlParams.get('section') === 'api') {
    activateSection(4);
  }

    // Función para mostrar los detalles del proyecto
    window.showProjectDetails = function(projectId) {
      // Ocultar la lista de proyectos
      projectsSection.classList.add("hidden");
  
      // Mostrar la sección de detalles del proyecto
      projectDetailsSection.classList.remove("hidden");
  
      // Obtener los detalles del proyecto (esto es solo un ejemplo, deberías obtener los datos del servidor)
      const project = projects.find(p => p.id === projectId);
  
      // Actualizar el contenido de la sección de detalles del proyecto
      document.getElementById('project-title').innerText = project.title;
      document.getElementById('project-description').innerText = project.description;
      document.getElementById('project-technologies').innerText = project.technologies.join(', ');
      document.getElementById('project-features').innerText = project.features.join(', ');


      // Actualizar el avatar del proyecto
      const projectAvatar = document.getElementById('project-avatar');
      if (project.avatar_url) {
        projectAvatar.src = project.avatar_url;
        projectAvatar.style.display = 'block';
      } else {
        console.log(project.avatar_url);
        projectAvatar.style.display = 'none';
      }

      // Actualizar el enlace de GitHub solo si no es null
      const projectGithubContainer = document.getElementById('project-github-container');
      if (project.github) {
        document.getElementById('project-github').innerHTML = `<a href="${project.github}" target="_blank">${project.github}</a>`;
        projectGithubContainer.style.display = 'block';
      } else {
        projectGithubContainer.style.display = 'none';
      }
    };
  
    // Función para volver a la lista de proyectos
    window.showProjectsList = function() {
      // Ocultar la sección de detalles del proyecto
      projectDetailsSection.classList.add("hidden");
  
      // Mostrar la lista de proyectos
      projectsSection.classList.remove("hidden");
    };
  
});
