var App = {
  init: function(){
	document.querySelectorAll('.nav-link').forEach(el =>
		el.addEventListener('click', function(e) {
			document.querySelectorAll('.nav-link').forEach(child => child.classList.remove('active'));
			e.target.classList.add('active');
		})
	);
  }
}

App.init();
