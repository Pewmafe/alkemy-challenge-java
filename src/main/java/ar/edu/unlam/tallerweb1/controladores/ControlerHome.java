package ar.edu.unlam.tallerweb1.controladores;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.User;

@Controller
public class ControlerHome {
	@RequestMapping(path = "/home", method = RequestMethod.GET)
	public ModelAndView homeView(HttpServletRequest request) {
		
		User usuarioLogueado = request.getSession().getAttribute("USUARIO") != null
				? (User) request.getSession().getAttribute("USUARIO")
				: null;
				
		if (usuarioLogueado == null) {
			return new ModelAndView("redirect:/login");
				}
		
		ModelMap modelo = new ModelMap();
		
		modelo.put("usuarioLogueado", usuarioLogueado);
		modelo.put("title", "Home");
		return new ModelAndView("home", modelo);
	}
}
