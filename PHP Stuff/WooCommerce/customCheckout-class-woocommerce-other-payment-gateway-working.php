<?php 
class WC_Other_Payment_Gateway extends WC_Payment_Gateway{

	public function __construct(){
		$this->id = 'other_payment';
		$this->method_title = __('Custom Payment','woocommerce-other-payment-gateway');
		$this->title = __('Custom Payment','woocommerce-other-payment-gateway');
		$this->has_fields = true;
		$this->init_form_fields();
		$this->init_settings();
		$this->enabled = $this->get_option('enabled');
		$this->title = $this->get_option('title');
		$this->description = $this->get_option('description');
		add_action('woocommerce_update_options_payment_gateways_'.$this->id, array($this, 'process_admin_options'));
	}
	public function init_form_fields(){
				$this->form_fields = array(
					'enabled' => array(
					'title' 		=> __( 'Enable/Disable', 'woocommerce-other-payment-gateway' ),
					'type' 			=> 'checkbox',
					'label' 		=> __( 'Enable Custom Payment', 'woocommerce-other-payment-gateway' ),
					'default' 		=> 'yes'
					),
					'title' => array(
						'title' 		=> __( 'Method Title', 'woocommerce-other-payment-gateway' ),
						'type' 			=> 'text',
						'description' 	=> __( 'This controls the title', 'woocommerce-other-payment-gateway' ),
						'default'		=> __( 'Custom Payment', 'woocommerce-other-payment-gateway' ),
						'desc_tip'		=> true,
					),
					'description' => array(
						'title' => __( 'Customer Message', 'woocommerce-other-payment-gateway' ),
						'type' => 'textarea',
						'css' => 'width:500px;',
						'default' => 'None of the other payment options are suitable for you? please drop us a note about your favourable payment option and we will contact you as soon as possible.',
						'description' 	=> __( 'The message which you want it to appear to the customer in the checkout page.', 'woocommerce-other-payment-gateway' ),
					)
			 );
	}
	
	/**
	 * Admin Panel Options
	 * - Options for bits like 'title' and availability on a country-by-country basis
	 *
	 * @since 1.0.0
	 * @return void
	 */
	public function admin_options() {
		?>
		<h3><?php _e( 'Custom Payment Settings', 'woocommerce-other-payment-gateway' ); ?></h3>
			<div id="poststuff">
				<div id="post-body" class="metabox-holder columns-2">
					<div id="post-body-content">
						<table class="form-table">
							<?php $this->generate_settings_html();?>
						</table><!--/.form-table-->
					</div>
					<div id="postbox-container-1" class="postbox-container">
	                        <div id="side-sortables" class="meta-box-sortables ui-sortable"> 
	                           
     							<div class="postbox ">
	                                <div class="handlediv" title="Click to toggle"><br></div>
	                                <h3 class="hndle"><span><i class="dashicons dashicons-update"></i>&nbsp;&nbsp;Upgrade to Pro</span></h3>
	                                <div class="inside">
	                                    <div class="support-widget">
	                                        <ul>
	                                            <li>» Full Form Builder</li>
	                                            <li>» Custom Gateway Icon</li>
	                                            <li>» Order Status After Checkout</li>
	                                            <li>» Custom API Requests</li>
	                                            <li>» Debugging Mode</li>
	                                            <li>» Auto Hassle-Free Updates</li>
	                                            <li>» High Priority Customer Support</li>
	                                        </ul>
											<a href="https://wpruby.com/plugin/woocommerce-custom-payment-gateway-pro/" class="button wpruby_button" target="_blank"><span class="dashicons dashicons-star-filled"></span> Upgrade Now</a> 
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="postbox ">
	                                <div class="handlediv" title="Click to toggle"><br></div>
	                                <h3 class="hndle"><span><i class="dashicons dashicons-editor-help"></i>&nbsp;&nbsp;Plugin Support</span></h3>
	                                <div class="inside">
	                                    <div class="support-widget">
	                                        <p>
	                                        <img style="width: 70%;margin: 0 auto;position: relative;display: inherit;" src="https://wpruby.com/wp-content/uploads/2016/03/wpruby_logo_with_ruby_color-300x88.png">
	                                        <br/>
	                                        Got a Question, Idea, Problem or Praise?</p>
	                                        <ul>
												<li>» Please leave us a <a target="_blank" href="https://wordpress.org/support/view/plugin-reviews/woocommerce-other-payment-gateway?filter=5#postform">★★★★★</a> rating.</li>
	                                            <li>» <a href="https://wpruby.com/submit-ticket/" target="_blank">Support Request</a></li>
	                                            <li>» <a href="https://wpruby.com/knowledgebase_category/woocommerce-custom-payment-gateway-pro/" target="_blank">Documentation and Common issues.</a></li>
	                                            <li>» <a href="https://wpruby.com/plugins/" target="_blank">Our Plugins Shop</a></li>
	                                        </ul>

	                                    </div>
	                                </div>
	                            </div>
	                       
	                            <div class="postbox rss-postbox">
	    							<div class="handlediv" title="Click to toggle"><br></div>
	    								<h3 class="hndle"><span><i class="fa fa-wordpress"></i>&nbsp;&nbsp;WPRuby Blog</span></h3>
	    								<div class="inside">
											<div class="rss-widget">
												<?php
	    											wp_widget_rss_output(array(
	    													'url' => 'https://wpruby.com/feed/',
	    													'title' => 'WPRuby Blog',
	    													'items' => 3,
	    													'show_summary' => 0,
	    													'show_author' => 0,
	    													'show_date' => 1,
	    											));
	    										?>
	    									</div>
	    								</div>
	    						</div>

	                        </div>
	                    </div>
                    </div>
				</div>
				<div class="clear"></div>
				<style type="text/css">
				.wpruby_button{
					background-color:#4CAF50 !important;
					border-color:#4CAF50 !important;
					color:#ffffff !important;
					width:100%;
					padding:5px !important;
					text-align:center;
					height:35px !important;
					font-size:12pt !important;
				}
				</style>
				<?php
	}
	public function process_payment( $order_id ) {
		global $woocommerce;
		$order = new WC_Order( $order_id );
		// Mark as on-hold (we're awaiting the cheque)
		$order->update_status('on-hold', __( 'Awaiting payment', 'woocommerce-other-payment-gateway' ));
		// Reduce stock levels
		$order->reduce_order_stock();
		if(isset($_POST[ $this->id.'-admin-note']) && trim($_POST[ $this->id.'-admin-note'])!=''){
			$order->add_order_note(esc_html($_POST[ $this->id.'-admin-note']),1);
		}
		// Remove cart
		$woocommerce->cart->empty_cart();
		// Return thankyou redirect
		return array(
			'result' => 'success',
			'redirect' => $this->get_return_url( $order )
		);	
	}

	public function payment_fields(){
		?>
		<fieldset>
			<p class="form-row form-row-wide">
				<label for="<?php echo $this->id; ?>-admin-note"><?php echo esc_attr($this->description); ?> <span class="required">*</span></label>
				<textarea id="<?php echo $this->id; ?>-admin-note" class="input-text" type="text" name="<?php echo $this->id; ?>-admin-note"></textarea>
			</p>						
			<div class="clear"></div>
		</fieldset>
		<?php
	}
}
/*
class WC_Other_Payment_Gateway_Monetary extends WC_Payment_Gateway{

	public function __construct(){
		$this->id = 'other_payment_monetary';
		$this->method_title = __('Custom Payment - Monetary Contribution','woocommerce-other-payment-gateway');
		$this->title = __('Custom Payment - Monetary Contribution','woocommerce-other-payment-gateway');
		$this->has_fields = true;
		$this->init_form_fields_monetary();
		$this->init_settings();
		$this->enabled = $this->get_option('enabled');
		$this->title = $this->get_option('title');
		$this->description = $this->get_option('description');
		add_action('woocommerce_update_options_payment_gateways_'.$this->id, array($this, 'process_admin_options_monetary'));
	}
	public function init_form_fields_monetary(){
				$this->form_fields_monetary = array(
					'enabled' => array(
					'title' 		=> __( 'Enable/Disable', 'woocommerce-other-payment-gateway' ),
					'type' 			=> 'checkbox',
					'label' 		=> __( 'Enable Custom Payment', 'woocommerce-other-payment-gateway' ),
					'default' 		=> 'yes'
					),
					'title' => array(
						'title' 		=> __( 'Method Title', 'woocommerce-other-payment-gateway' ),
						'type' 			=> 'text',
						'description' 	=> __( 'This controls the title', 'woocommerce-other-payment-gateway' ),
						'default'		=> __( 'Custom Payment', 'woocommerce-other-payment-gateway' ),
						'desc_tip'		=> true,
					),
					'description' => array(
						'title' => __( 'Customer Message', 'woocommerce-other-payment-gateway' ),
						'type' => 'textarea',
						'css' => 'width:500px;',
						'default' => 'None of the other payment options are suitable for you? please drop us a note about your favourable payment option and we will contact you as soon as possible.',
						'description' 	=> __( 'The message which you want it to appear to the customer in the checkout page.', 'woocommerce-other-payment-gateway' ),
					)
			 );
	}
	
	/*
	 * Admin Panel Options
	 * - Options for bits like 'title' and availability on a country-by-country basis
	 *
	 * @since 1.0.0
	 * @return void
	 */
/*
	public function admin_options_monetary() {
		?>
		<h3><?php _e( 'Custom Payment Settings Monetary', 'woocommerce-other-payment-gateway' ); ?></h3>
			<div id="poststuff">
				<div id="post-body" class="metabox-holder columns-2">
					<div id="post-body-content">
						<table class="form-table">
							<?php $this->generate_settings_html();?>
						</table><!--/.form-table-->
					</div>
					<div id="postbox-container-1" class="postbox-container">
	                        <div id="side-sortables" class="meta-box-sortables ui-sortable"> 
	                           
     							<div class="postbox ">
	                                <div class="handlediv" title="Click to toggle"><br></div>
	                                <h3 class="hndle"><span><i class="dashicons dashicons-update"></i>&nbsp;&nbsp;Upgrade to Pro</span></h3>
	                                <div class="inside">
	                                    <div class="support-widget">
	                                        <ul>
	                                            <li>» Full Form Builder</li>
	                                            <li>» Custom Gateway Icon</li>
	                                            <li>» Order Status After Checkout</li>
	                                            <li>» Custom API Requests</li>
	                                            <li>» Debugging Mode</li>
	                                            <li>» Auto Hassle-Free Updates</li>
	                                            <li>» High Priority Customer Support</li>
	                                        </ul>
											<a href="https://wpruby.com/plugin/woocommerce-custom-payment-gateway-pro/" class="button wpruby_button" target="_blank"><span class="dashicons dashicons-star-filled"></span> Upgrade Now</a> 
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="postbox ">
	                                <div class="handlediv" title="Click to toggle"><br></div>
	                                <h3 class="hndle"><span><i class="dashicons dashicons-editor-help"></i>&nbsp;&nbsp;Plugin Support</span></h3>
	                                <div class="inside">
	                                    <div class="support-widget">
	                                        <p>
	                                        <img style="width: 70%;margin: 0 auto;position: relative;display: inherit;" src="https://wpruby.com/wp-content/uploads/2016/03/wpruby_logo_with_ruby_color-300x88.png">
	                                        <br/>
	                                        Got a Question, Idea, Problem or Praise?</p>
	                                        <ul>
												<li>» Please leave us a <a target="_blank" href="https://wordpress.org/support/view/plugin-reviews/woocommerce-other-payment-gateway?filter=5#postform">★★★★★</a> rating.</li>
	                                            <li>» <a href="https://wpruby.com/submit-ticket/" target="_blank">Support Request</a></li>
	                                            <li>» <a href="https://wpruby.com/knowledgebase_category/woocommerce-custom-payment-gateway-pro/" target="_blank">Documentation and Common issues.</a></li>
	                                            <li>» <a href="https://wpruby.com/plugins/" target="_blank">Our Plugins Shop</a></li>
	                                        </ul>

	                                    </div>
	                                </div>
	                            </div>
	                       
	                            <div class="postbox rss-postbox">
	    							<div class="handlediv" title="Click to toggle"><br></div>
	    								<h3 class="hndle"><span><i class="fa fa-wordpress"></i>&nbsp;&nbsp;WPRuby Blog</span></h3>
	    								<div class="inside">
											<div class="rss-widget">
												<?php
	    											wp_widget_rss_output(array(
	    													'url' => 'https://wpruby.com/feed/',
	    													'title' => 'WPRuby Blog',
	    													'items' => 3,
	    													'show_summary' => 0,
	    													'show_author' => 0,
	    													'show_date' => 1,
	    											));
	    										?>
	    									</div>
	    								</div>
	    						</div>

	                        </div>
	                    </div>
                    </div>
				</div>
				<div class="clear"></div>
				<style type="text/css">
				.wpruby_button{
					background-color:#4CAF50 !important;
					border-color:#4CAF50 !important;
					color:#ffffff !important;
					width:100%;
					padding:5px !important;
					text-align:center;
					height:35px !important;
					font-size:12pt !important;
				}
				</style>
				<?php
	}
	/*
	public function process_payment( $order_id ) {
		global $woocommerce;
		$order = new WC_Order( $order_id );
		// Mark as on-hold (we're awaiting the cheque)
		$order->update_status('on-hold', __( 'Awaiting payment', 'woocommerce-other-payment-gateway' ));
		// Reduce stock levels
		$order->reduce_order_stock();
		if(isset($_POST[ $this->id.'-admin-note']) && trim($_POST[ $this->id.'-admin-note'])!=''){
			$order->add_order_note(esc_html($_POST[ $this->id.'-admin-note']),1);
		}
		// Remove cart
		$woocommerce->cart->empty_cart();
		// Return thankyou redirect
		return array(
			'result' => 'success',
			'redirect' => $this->get_return_url( $order )
		);	
	}
	*/
/*
	public function payment_fields_monetary(){
		?>
		<fieldset>
			<p class="form-row form-row-wide">
				<label for="<?php echo $this->id; ?>-admin-note"><?php echo esc_attr($this->description); ?> <span class="required">*</span></label>
				<textarea id="<?php echo $this->id; ?>-admin-note" class="input-text" type="text" name="<?php echo $this->id; ?>-admin-note"></textarea>
			</p>						
			<div class="clear"></div>
		</fieldset>
		<?php
	}
}

class WC_Other_Payment_Gateway_Spread_Words extends WC_Payment_Gateway{

	public function __construct(){
		$this->id = 'other_payment_spread_words';
		$this->method_title = __('Custom Payment - Spread Words','woocommerce-other-payment-gateway');
		$this->title = __('Custom Payment - Spread Words','woocommerce-other-payment-gateway');
		$this->has_fields = true;
		$this->init_form_fields_spread_words();
		$this->init_settings();
		$this->enabled = $this->get_option('enabled');
		$this->title = $this->get_option('title');
		$this->description = $this->get_option('description');
		add_action('woocommerce_update_options_payment_gateways_'.$this->id, array($this, 'process_admin_options_spread_words'));
	}
	public function init_form_fields_spread_words(){
				$this->form_fields_spread_words = array(
					'enabled' => array(
					'title' 		=> __( 'Enable/Disable', 'woocommerce-other-payment-gateway' ),
					'type' 			=> 'checkbox',
					'label' 		=> __( 'Enable Custom Payment', 'woocommerce-other-payment-gateway' ),
					'default' 		=> 'yes'
					),
					'title' => array(
						'title' 		=> __( 'Method Title', 'woocommerce-other-payment-gateway' ),
						'type' 			=> 'text',
						'description' 	=> __( 'This controls the title', 'woocommerce-other-payment-gateway' ),
						'default'		=> __( 'Custom Payment', 'woocommerce-other-payment-gateway' ),
						'desc_tip'		=> true,
					),
					'description' => array(
						'title' => __( 'Customer Message', 'woocommerce-other-payment-gateway' ),
						'type' => 'textarea',
						'css' => 'width:500px;',
						'default' => 'None of the other payment options are suitable for you? please drop us a note about your favourable payment option and we will contact you as soon as possible.',
						'description' 	=> __( 'The message which you want it to appear to the customer in the checkout page.', 'woocommerce-other-payment-gateway' ),
					)
			 );
	}
	
	/**
	 * Admin Panel Options
	 * - Options for bits like 'title' and availability on a country-by-country basis
	 *
	 * @since 1.0.0
	 * @return void
	 */
/*
	public function admin_options_spread_words() {
		?>
		<h3><?php _e( 'Custom Payment Settings_Spread_Words', 'woocommerce-other-payment-gateway' ); ?></h3>
			<div id="poststuff">
				<div id="post-body" class="metabox-holder columns-2">
					<div id="post-body-content">
						<table class="form-table">
							<?php $this->generate_settings_html();?>
						</table><!--/.form-table-->
					</div>
					<div id="postbox-container-1" class="postbox-container">
	                        <div id="side-sortables" class="meta-box-sortables ui-sortable"> 
	                           
     							<div class="postbox ">
	                                <div class="handlediv" title="Click to toggle"><br></div>
	                                <h3 class="hndle"><span><i class="dashicons dashicons-update"></i>&nbsp;&nbsp;Upgrade to Pro</span></h3>
	                                <div class="inside">
	                                    <div class="support-widget">
	                                        <ul>
	                                            <li>» Full Form Builder</li>
	                                            <li>» Custom Gateway Icon</li>
	                                            <li>» Order Status After Checkout</li>
	                                            <li>» Custom API Requests</li>
	                                            <li>» Debugging Mode</li>
	                                            <li>» Auto Hassle-Free Updates</li>
	                                            <li>» High Priority Customer Support</li>
	                                        </ul>
											<a href="https://wpruby.com/plugin/woocommerce-custom-payment-gateway-pro/" class="button wpruby_button" target="_blank"><span class="dashicons dashicons-star-filled"></span> Upgrade Now</a> 
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="postbox ">
	                                <div class="handlediv" title="Click to toggle"><br></div>
	                                <h3 class="hndle"><span><i class="dashicons dashicons-editor-help"></i>&nbsp;&nbsp;Plugin Support</span></h3>
	                                <div class="inside">
	                                    <div class="support-widget">
	                                        <p>
	                                        <img style="width: 70%;margin: 0 auto;position: relative;display: inherit;" src="https://wpruby.com/wp-content/uploads/2016/03/wpruby_logo_with_ruby_color-300x88.png">
	                                        <br/>
	                                        Got a Question, Idea, Problem or Praise?</p>
	                                        <ul>
												<li>» Please leave us a <a target="_blank" href="https://wordpress.org/support/view/plugin-reviews/woocommerce-other-payment-gateway?filter=5#postform">★★★★★</a> rating.</li>
	                                            <li>» <a href="https://wpruby.com/submit-ticket/" target="_blank">Support Request</a></li>
	                                            <li>» <a href="https://wpruby.com/knowledgebase_category/woocommerce-custom-payment-gateway-pro/" target="_blank">Documentation and Common issues.</a></li>
	                                            <li>» <a href="https://wpruby.com/plugins/" target="_blank">Our Plugins Shop</a></li>
	                                        </ul>

	                                    </div>
	                                </div>
	                            </div>
	                       
	                            <div class="postbox rss-postbox">
	    							<div class="handlediv" title="Click to toggle"><br></div>
	    								<h3 class="hndle"><span><i class="fa fa-wordpress"></i>&nbsp;&nbsp;WPRuby Blog</span></h3>
	    								<div class="inside">
											<div class="rss-widget">
												<?php
	    											wp_widget_rss_output(array(
	    													'url' => 'https://wpruby.com/feed/',
	    													'title' => 'WPRuby Blog',
	    													'items' => 3,
	    													'show_summary' => 0,
	    													'show_author' => 0,
	    													'show_date' => 1,
	    											));
	    										?>
	    									</div>
	    								</div>
	    						</div>

	                        </div>
	                    </div>
                    </div>
				</div>
				<div class="clear"></div>
				<style type="text/css">
				.wpruby_button{
					background-color:#4CAF50 !important;
					border-color:#4CAF50 !important;
					color:#ffffff !important;
					width:100%;
					padding:5px !important;
					text-align:center;
					height:35px !important;
					font-size:12pt !important;
				}
				</style>
				<?php
	}
	/*
	public function process_payment( $order_id ) {
		global $woocommerce;
		$order = new WC_Order( $order_id );
		// Mark as on-hold (we're awaiting the cheque)
		$order->update_status('on-hold', __( 'Awaiting payment', 'woocommerce-other-payment-gateway' ));
		// Reduce stock levels
		$order->reduce_order_stock();
		if(isset($_POST[ $this->id.'-admin-note']) && trim($_POST[ $this->id.'-admin-note'])!=''){
			$order->add_order_note(esc_html($_POST[ $this->id.'-admin-note']),1);
		}
		// Remove cart
		$woocommerce->cart->empty_cart();
		// Return thankyou redirect
		return array(
			'result' => 'success',
			'redirect' => $this->get_return_url( $order )
		);	
	}
	*/
/*
	public function payment_fields_spread_words(){
		?>
		<fieldset>
			<p class="form-row form-row-wide">
				<label for="<?php echo $this->id; ?>-admin-note"><?php echo esc_attr($this->description); ?> <span class="required">*</span></label>
				<textarea id="<?php echo $this->id; ?>-admin-note" class="input-text" type="text" name="<?php echo $this->id; ?>-admin-note"></textarea>
			</p>						
			<div class="clear"></div>
		</fieldset>
		<?php
	}
}
