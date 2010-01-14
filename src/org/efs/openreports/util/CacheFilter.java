package org.efs.openreports.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
    
public class CacheFilter implements Filter {

	private FilterConfig configs = null;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

		HttpServletResponse response = (HttpServletResponse) resp;

		for (Enumeration e = configs.getInitParameterNames(); e.hasMoreElements();) {
			String headerName = (String) e.nextElement();
			response.addHeader(headerName, configs.getInitParameter(headerName));
		}

		chain.doFilter(req, response);
	}

	@Override
	public void init(FilterConfig configs) throws ServletException {

		this.configs = configs;

	}

}
