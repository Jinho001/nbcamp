package com.zero.waste;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	 	private String connectPath = "/resources/upload/**";
	    private String resourcePath = "file:///var/webapps/upload/";

	    @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler(connectPath)
	                .addResourceLocations(resourcePath);
	    }
}
