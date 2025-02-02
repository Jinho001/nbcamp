package com.zero.user.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.zero.user.filter.CustomLoginRedirectFilter;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration // IoC 빈(bean)을 등록
//@EnableWebSecurity(debug = true)
@EnableWebSecurity
public class SecurityConfig {

    private final PrincipalOAuth2USerService principalOAuth2USerService;
	private final CustomLoginRedirectFilter customLoginRedirectFilter; // CustomLoginRedirectFilter 주입

	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    	http.csrf().disable();
    	http.authorizeRequests()
            .antMatchers("/admin/**", "/board/modify", "board/remove").hasRole("ADMIN")
    		.antMatchers("/activity/**", "/regimap").hasRole("USER")
    		.antMatchers("/user/login", "/user/login/error", "/user/logout", "/user/join", "/user/registerCheck").permitAll()
    		.antMatchers("/user/**").authenticated()
            .anyRequest().permitAll()
            .and()
            .formLogin()
                .loginPage("/user/login")
                .usernameParameter("userid")
                .passwordParameter("password")
                .loginProcessingUrl("/user/login")
                .defaultSuccessUrl("/")
                .failureUrl("/user/login/error")
            .and()
            .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/user/logout"))
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
            .and()
            .oauth2Login()
                .loginPage("/user/login")
                .userInfoEndpoint()
                    .userService(principalOAuth2USerService);
        
        http.exceptionHandling()
	        .accessDeniedHandler((request, response, accessDeniedException) -> {
	            response.sendRedirect("/user/login");
	        });
//            .authenticationEntryPoint(new CustomAuthenticationEntryPoint());
		http.addFilterBefore(customLoginRedirectFilter, UsernamePasswordAuthenticationFilter.class);

		return http.build();
    }
}
