<?php
/**
 * 2013-2015 Froggy Commerce
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
 * @copyright 2013-2015 Froggy Commerce
 * @license   Unauthorized copying of this file, via any medium is strictly prohibited
 */

/*
 * Security
 */
defined('_PS_VERSION_') || require dirname(__FILE__).'/index.php';

class FroggyCartOrderObject extends ObjectModel
{
    public $id;

    /** @var integer Order ID */
    public $id_order;

    /** @var integer Employee ID */
    public $id_employee;

    /** @var integer Customer ID */
    public $id_customer;

    /** @var string Payment */
    public $payment;

    /** @var string Date */
    public $date_add;

    /**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'fc_co_order',
        'primary' => 'id_fc_co_order',
        'multilang' => false,
        'fields' => array(
            'id_order' =>      array('type' => 1, 'validate' => 'isUnsignedId', 'required' => true),
            'id_employee' =>   array('type' => 1, 'validate' => 'isUnsignedId', 'required' => true),
            'id_customer' =>   array('type' => 1, 'validate' => 'isUnsignedId', 'required' => true),
            'payment' =>       array('type' => 3, 'required' => true, 'size' => 20),
            'date_add' =>      array('type' => 5, 'validate' => 'isDate', 'copy_post' => false),
        ),
    );
    /* Can't use constant if we want to be compliant with PS 1.4
     * const TYPE_INT = 1;
     * const TYPE_BOOL = 2;
     * const TYPE_STRING = 3;
     * const TYPE_FLOAT = 4;
     * const TYPE_DATE = 5;
     * const TYPE_HTML = 6;
     * const TYPE_NOTHING = 7;
     */


    /*** Retrocompatibility 1.4 ***/

    protected $fieldsRequired = array('id_order', 'id_employee', 'id_customer');
    protected $fieldsSize = array('id_order' => 32, 'id_employee' => 32, 'id_customer' => 32);
    protected $fieldsValidate = array('id_order' => 'isUnsignedInt');

    protected $table = 'fc_co_order';
    protected $identifier = 'id_fc_co_order';

    public function getFields()
    {
        if (version_compare(_PS_VERSION_, '1.5') >= 0) {
            return parent::getFields();
        }

        $fields = array();
        parent::validateFields();
        $fields['id_order'] = (int)$this->id_order;
        $fields['id_employee'] = (int)$this->id_employee;
        $fields['id_customer'] = (int)$this->id_customer;
        $fields['payment'] = pSQL($this->payment);
        $fields['date_add'] = pSQL($this->date_add);

        return $fields;
    }
}
