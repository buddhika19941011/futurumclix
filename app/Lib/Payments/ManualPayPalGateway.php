<?php
/**
 * Copyright (c) 2018 FuturumClix
 *
 * This program is free software: you can redistribute it and/or  modify
 * it under the terms of the GNU Affero General Public License, version 3,
 * as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Please notice this program incorporates variety of libraries or other
 * programs that may or may not have their own licenses, also they may or
 * may not be modified by FuturumClix. All modifications made by
 * FuturumClix are available under the terms of GNU Affero General Public
 * License, version 3, if original license allows that.
 *
 * @copyright     Copyright (c) 2018 FuturumClix
 * @link          https://github.com/futurumclix/futurumclix
 * @license       https://opensource.org/licenses/AGPL-3.0 AGPLv3
 */
App::uses('GatewayInterface', 'Payments');

/**
 * ManualPayPalGateway
 *
 */
class ManualPayPalGateway implements GatewayInterface {
	protected $settings;
	protected $debug;

	public function __construct($settings = array()) {
		$this->settings = $settings['api_settings'];
		$this->settings['currency_code'] = $settings['currency_code'];
		$this->debug = Configure::read('debug');
	}

	public function pay(array $params = array()) {
		$payment = array(
			'internal_gateway' => 'ManualPayPal',
			'gateway' => 'PayPal',
			'to_account' => $this->settings['account'],
			'from_account' => @$params['user_data']['UserProfile']['manual_pay_pal'],
			'id' => $params['id'],
			'title' => $params['title'],
			'amount' => round($params['amount'], 2),
			'currency' => $this->settings['currency_code'],
		);

		CakeSession::write('ManualPayment', $payment);

		return array('plugin' => null, 'controller' => 'payments', 'action' => 'manual');
	}

	public static function needsSettings() {
		return true;
	}

	public static function validateSettings(array $check = array()) {
		return true;
	}

	public static function getAccountValidationRules() {
		return true;
	}

	public static function getSupportedCurrencies($direction) {
		switch($direction) {
			case 'Deposit':
				return array(
					'AUD',
					'BRL',
					'CAD',
					'CZK',
					'DKK',
					'EUR',
					'HKD',
					'HUF',
					'ILS',
					'JPY',
					'MYR',
					'MXN',
					'NOK',
					'NZD',
					'PHP',
					'PLN',
					'GBP',
					'RUB',
					'SGD',
					'SEK',
					'CHF',
					'TWD',
					'THB',
					'TRY',
					'USD'
				);
			case 'Cashout':
				return array();
		}
	}

	public function getCashoutId(array $data = array()) {
		throw new PaymentGatewayException(__d('exception', 'Not supported'));
	}

	public function cashoutCallback(array $data = array()) {
		throw new PaymentGatewayException(__d('exception', 'Not supported'));
	}

	public function refund($transactionId) {
		throw new PaymentGatewayException(__d('exception', 'Not supported'));
	}

	public function getOperationName(array $data = array()) {
		throw new PaymentGatewayException(__d('exception', 'Not supported'));
	}

	public function depositCallback(array $data = array()) {
		throw new PaymentGatewayException(__d('exception', 'Not supported'));
	}

	public function getDepositGatewayId(array $data = array()) {
		throw new PaymentGatewayException(__d('exception', 'Not supported'));
	}

	public function cashout($cashout) {
		throw new PaymentGatewayException(__d('exception', 'Not supported'));
	}

	public function generatePaymentList($cashouts) {
		return false;
	}

	public function supportsRefunds() {
		return false;
	}
}
