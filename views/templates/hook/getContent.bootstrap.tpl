{**
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
*}

<h2 align="center">{l s='Froggy Cart to Order' mod='froggycartorder'} BOOTSTRAP</h2>

<fieldset id="froggycartorder_fieldset">

    <legend><img src="{$froggycartorder.module_dir}logo.png" alt="" width="16" />{l s='Convert cart to order' mod='froggycartorder'}</legend>

    {if $froggycartorder.convert_result ne ''}
        {if $froggycartorder.convert_result eq 'OK'}
            <div class="conf confirm">{l s='Cart was successfully converted'}</div>
        {else}
            <div class="alert error">{l s='An error occured, cart was not converted'}</div>
        {/if}
        <p align="center"><a href="{$froggycartorder.current_url}">{l s='Return'}</a></p>
    {else}
        <div id="froggycartorder_admin">
            <form method="POST" action="">
                <label>{l s='Choose the cart' mod='froggycartorder'}</label>
                <div>
                    <select name="id_cart" id="id_cart">
                        {foreach from=$froggycartorder.last_carts item=c}
                            <option value="{$c.id_cart}">#{$c.id_cart} - {$c.customer} - {$c.total}</option>
                        {/foreach}
                    </select> ({l s='Only the' mod='froggycartorder'} <b>{$froggycartorder.cart_limit}</b> {l s='last carts are displayed in this list' mod='froggycartorder'})
                </div><br>
                <label>{l s='Or enter the customer e-mail' mod='froggycartorder'}</label>
                <div>
                    <input type="text" name="customer_email" id="customer_email" />
                    <input type="hidden" name="id_cart_manual" id="id_cart_manual" value="" />
                    <div id="customer_carts_list"></div>
                </div>

                <br><br>

                <label>{l s='Choose the payment method' mod='froggycartorder'}</label>
                <div>
                    <select name="payment_method">
                    {foreach from=$froggycartorder.available_payment_methods item=apm}
                        <option value="{$apm.payment}">{$apm.payment}</option>
                    {/foreach}
                    </select>
                </div><br>
                <label>{l s='Or write your payment method' mod='froggycartorder'}</label>
                <div><input type="text" name="payment_method_manual" /></div>

                <br><br>

                <label>{l s='Choose the order status' mod='froggycartorder'}</label>
                <div>
                    <select name="id_order_state">
                    {foreach from=$froggycartorder.order_state_list item=os}
                        <option value="{$os.id_order_state}">{$os.name}</option>
                    {/foreach}
                    </select>
                </div><br>

                <p align="center"><input type="submit" value="{l s='Convert' mod='froggycartorder'}" name="froggycartorder_form" class="button" /></p>
            </form>
        </div>
    {/if}
</fieldset>

<script type="text/javascript" src="{$froggycartorder.module_dir}views/js/froggycartorder.js"></script>