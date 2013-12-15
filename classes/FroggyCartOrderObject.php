<?php

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
			'id_order' => 					array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
			'id_employee' => 				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
			'id_customer' => 				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
			'payment' => 					array('type' => self::TYPE_STRING, 'required' => true, 'size' => 20),
			'date_add' => 					array('type' => self::TYPE_DATE, 'validate' => 'isDate', 'copy_post' => false),
		),
	);
}