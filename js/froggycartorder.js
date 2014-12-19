/**
 * 2013-2014 Froggy Commerce
 *
 * NOTICE OF LICENSE
 *
 * You should have received a licence with this module.
 * If you didn't buy this module on Froggy-Commerce.com, ThemeForest.net
 * or Addons.PrestaShop.com, please contact us immediately : contact@froggy-commerce.com
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to benefit the updates
 * for newer PrestaShop versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    Froggy Commerce <contact@froggy-commerce.com>
 * @copyright 2013-2014 Froggy Commerce
 * @license   Unauthorized copying of this file, via any medium is strictly prohibited
 */


function froggyCartOrderShowStep(box_id, field_to_check)
{
    // Set flag
    var display_flag = false;
    if (field_to_check == 'payment_method' && ($('#'+field_to_check).val() != '' || $('#'+field_to_check+'_manual').val() != ''))
        display_flag = true;
    else if (field_to_check != 'payment_method' && ($('#'+field_to_check).val() > 0 || $('#'+field_to_check+'_manual').val() > 0))
        display_flag = true;

    // Display box depending on flag
    if (display_flag)
        $('#'+box_id+'_box').fadeIn();
    else
        $('#'+box_id+'_box').fadeOut();
}


function froggyCartOrderSelection()
{
    // Reset style
    $('#id_cart').removeAttr('disabled');
    $('.cart-selection').css('font-weight', 'normal');

    $('.cart-selection').unbind('click').bind('click', function() {

        // Retrieve Cart ID
        var value = $(this).attr('href');
        value = value.replace('#', '');

        // Disable select
        $('#id_cart').attr('disabled', 'disabled');

        // Set in bold cart selected
        $('.cart-selection').css('font-weight', 'normal');
        $(this).css('font-weight', 'bold');

        // Set cart
        $('#id_cart_manual').val(value);

        // Show step 2
        froggyCartOrderShowStep('payment_method', 'id_cart');

        return false;
    });
}

var email_froggy_cart_order;

$(document).ready(function() {


    // Hide steps
    $('#payment_method_box').hide();
    $('#order_state_box').hide();
    $('#convert_cart_box').hide();

    // Hide customer cart result div
    $('#customer_carts_list').hide();

    // Cart selection
    $('#id_cart').change(function() {
        froggyCartOrderShowStep('payment_method', 'id_cart');
    });


    // Retrieve cart from customer email
    $('#customer_email').keyup(function() {

        // Retrieve email
        email_froggy_cart_order = $(this).val();

        // If email is empty, empty carts list
        if (email_froggy_cart_order == '')
        {
            // Hide customer cart result div
            $('#customer_carts_list').fadeOut();
            $('#customer_carts_list').html('');
        }
        else
        {
            // Show customer cart result div
            $('#customer_carts_list').fadeIn();

            // Build ajax url
            var url = window.location.href+'&ajax_mode=true&get_cart_by_email='+email_froggy_cart_order;
            if (froggycartorder_ps_version != '1.4')
                url = url.replace('index.php', 'ajax-tab.php');

            // Make ajax request
            $.ajax({
                url: url,
                success: function(data) {

                    // Parse JSON
                    obj = $.parseJSON(data);

                    // Build carts list
                    var html = '';
                    $.each(obj, function(key, val) {
                        html += '<a class="cart-selection" href="#'+val.id_cart+'"><span>#'+val.id_cart+' - '+val.customer+' - '+val.total+'</span></a>';
                    });

                    // If html is empty
                    if (html == '')
                        html = froggycartorder_no_match_found_label;

                    // Display carts list
                    $('#customer_carts_list').html(html);

                    // Bind cart click
                    froggyCartOrderSelection();
                }
            });
        }

        // Show step 2
        froggyCartOrderShowStep('payment_method', 'id_cart');

        return false;
    });


    // Payment method selection
    $('#payment_method').change(function() {
        froggyCartOrderShowStep('order_state', 'payment_method');
    });
    $('#payment_method_manual').keyup(function() {
        froggyCartOrderShowStep('order_state', 'payment_method');
    });


    // Order state selection
    $('#id_order_state').change(function() {
        froggyCartOrderShowStep('convert_cart', 'id_order_state');
    });


});