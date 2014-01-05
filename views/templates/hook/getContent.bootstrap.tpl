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
<h2 align="center">{l s='Froggy Cart to Order' mod='froggycartorder'}</h2>

<fieldset id="froggycartorder_fieldset">

    <legend><img src="{$froggycartorder.module_dir}logo.png" alt="" width="16" />{l s='Convert cart to order' mod='froggycartorder'}</legend>

    {if $froggycartorder.convert_result ne ''}
        {if $froggycartorder.convert_result eq 'OK'}
            <div class="module_confirmation conf confirm alert alert-success">{l s='Cart was successfully converted' mod='froggycartorder'}</div>
        {else}
            <div class="module_confirmation conf confirm alert alert-danger">{l s='An error occured, cart was not converted' mod='froggycartorder'}</div>
        {/if}
        <p align="center"><a href="{$froggycartorder.current_url}">{l s='Return' mod='froggycartorder'}</a></p>
    {else}
        <div id="froggycartorder_admin" class="panel">
            <form method="POST" action="" class="form-horizontal">

                <h3>1. {l s='Select cart' mod='froggycartorder'}</h3>
                <div class="form-group">
                    <label class="control-label col-lg-3">{l s='Choose a cart' mod='froggycartorder'}</label>
                    <div class="col-lg-9">
                        <select name="id_cart" id="id_cart">
                            <option value="0">{l s='- Choose between the 50 last carts -' mod='froggycartorder'}</option>
                            {foreach from=$froggycartorder.last_carts item=c}
                                <option value="{$c.id_cart}">#{$c.id_cart} - {$c.customer} - {$c.total}</option>
                            {/foreach}
                        </select> 
                        <p class="help-block">({l s='Only the' mod='froggycartorder'} <b>{$froggycartorder.cart_limit}</b> {l s='last carts are displayed in this list' mod='froggycartorder'})</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">{l s='Or enter the customer e-mail' mod='froggycartorder'}</label>
                    <div class="col-lg-9">
                        <input type="text" name="customer_email" id="customer_email" />
                        <input type="hidden" name="id_cart_manual" id="id_cart_manual" value="" />
                        <div id="customer_carts_list"></div>
                    </div>
                </div>
                <div id="payment_method_box">
                    <h3>2. {l s='Select payment method' mod='froggycartorder'}</h3>
                    <div class="form-group">
                        <label class="control-label col-lg-3">{l s='Choose an existing payment method' mod='froggycartorder'}</label>
                        <div class="col-lg-9">
                            <select name="payment_method" id="payment_method">
                                <option value="">{l s='- Choose the payment method -'}</option>
                                {foreach from=$froggycartorder.available_payment_methods item=apm}
                                    <option value="{$apm.payment}">{$apm.payment}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">{l s='Or write your payment method' mod='froggycartorder'}</label>
                        <div class="col-lg-9"><input type="text" name="payment_method_manual" id="payment_method_manual" /></div>
                    </div>
                </div>

                <div id="order_state_box">
                    <h3>3. {l s='Select order state'}</h3>
                    <div class="form-group">
                        <label class="control-label col-lg-3">{l s='Choose the order status' mod='froggycartorder'}</label>
                        <div class="col-lg-9">
                            <select name="id_order_state" id="id_order_state">
                                <option value="0">{l s='- Choose the order state -' mod='froggycartorder'}</option>
                                {foreach from=$froggycartorder.order_state_list item=os}
                                    <option value="{$os.id_order_state}">{$os.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                </div>

                <div id="convert_cart_box">
                    <h3>4. {l s='Convert cart to order' mod='froggycartorder'}</h3>
                    <div class="form-group">
                        <div class="col-lg-9 col-lg-offset-3"><input type="submit" value="{l s='Convert' mod='froggycartorder'}" name="froggycartorder_form" class="btn btn-default" /></div>
                    </div>
                </div>
            </form>
        </div>
    {/if}
</fieldset>

<link href="{$froggycartorder.module_dir}views/css/froggycartorder.bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="{$froggycartorder.module_dir}views/js/froggycartorder.js"></script>