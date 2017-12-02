package com.grocersbasketfrontend.exceptions;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {

	
	/*@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ModelAndView handlerNoHandlerFoundException() {
		
		ModelAndView mv = new ModelAndView("error");
		
		return mv;
	}
	*/
	  @ExceptionHandler
	    @ResponseStatus(HttpStatus.NOT_FOUND)
	    public ModelAndView handleExceptiond (NoHandlerFoundException ex) {
	            ModelAndView mav = new ModelAndView();
	            mav.setViewName("error");
	            return mav;
	    }
	
	}
	