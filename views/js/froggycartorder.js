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
 *  @author Froggy Commerce <contact@froggy-commerce.com>
 *  @copyright  2013-2014 Froggy Commerce
 */

function froggyCartOrderSelection()
{
    // Reset style
    $('#id_cart').prop('disabled', false);
    $('.cart-selection').css('font-weight', 'normal');

    $('.cart-selection').unbind('click').bind('click', function() {

        // Retrieve Cart ID
        var value = $(this).attr('href');
        value = value.replace('#', '');

        // Disable select
        $('#id_cart').prop('disabled', 'disabled');

        // Set in bold cart selected
        $('.cart-selection').css('font-weight', 'normal');
        $(this).css('font-weight', 'bold');

        // Set cart
        $('#id_cart_manual').val(value);

        return false;
    });
}

var email_froggy_cart_order;

$(document).ready(function() {
    $('#customer_email').keyup(function() {

        // Retrieve email
        email_froggy_cart_order = $(this).val();

        // If email is empty, empty carts list
        if (email_froggy_cart_order == '')
            $('#customer_carts_list').html('');
        else
        {
            // Build ajax url
            var url = window.location.href+'&ajax_mode=true&get_cart_by_email='+email_froggy_cart_order;
            url = url.replace('index.php', 'ajax-tab.php');

            // Make ajax request
            $.ajax({
                url: url,
            }).done(function(data) {

                // Parse JSON
                obj = $.parseJSON(data);

                // Build carts list
                var html = '';
                $.each(obj, function(key, val) {
                    html += '<a class="cart-selection" href="#'+val.id_cart+'">#'+val.id_cart+' - '+val.customer+' - '+val.total+'</a><br>';
                });

                // Display carts list
                $('#customer_carts_list').html(html);

                // Bind cart click
                froggyCartOrderSelection();
            });
        }

        return false;
    });
});