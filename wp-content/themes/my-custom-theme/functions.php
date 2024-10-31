<?php
/**
 * MyCustomTheme functions and definitions
 */
if ( ! function_exists( 'support' ) ) :
	function support() {
		// Enqueue editor styles.
		add_editor_style( 'style.css' );
	}

endif;

add_action( 'after_setup_theme', 'support' );

if ( ! function_exists( 'styles' ) ) :
	function styles() {
		// Register theme stylesheet.
		$theme_version = wp_get_theme()->get( 'Version' );

		$version_string = is_string( $theme_version ) ? $theme_version : false;
		wp_register_style(
			'my-custom-theme-style',
			get_template_directory_uri() . '/style.css',
			array(),
			$version_string
		);

		// Enqueue theme stylesheet.
		wp_enqueue_style( 'my-custom-theme-style' );
	}

endif;

add_action( 'wp_enqueue_scripts', 'styles' );