import React from 'react'
import NoPayType from './NoPayType';
import CreditCardPayType from './CreditCardPayType';
import CheckPayType from './CheckPayType';
import PurchaseOrderPayType from './PurchaseOrderPayType';
class PayTypeSelector extends React.Component {

    onPayTypeSelected(event) {
        this.setState({ selectedPayType: event.target.value });
    }
    constructor(props) {
         super(props);
         this.onPayTypeSelected = this.onPayTypeSelected.bind(this);
         this.state = { selectedPayType: null };
        }
  
render() {
    let PayTypeCustomComponent = NoPayType;
 if (this.state.selectedPayType == "credit card") {
 PayTypeCustomComponent = CreditCardPayType;
 } else if (this.state.selectedPayType == "check") {
 PayTypeCustomComponent = CheckPayType;
 } else if (this.state.selectedPayType == "purchase order") {
 PayTypeCustomComponent = PurchaseOrderPayType;
 }
return (
 <div>
 <div className="field">
 <label htmlFor="order_pay_type">Pay type</label>
 <select id="order_pay_type" onChange={this.onPayTypeSelected}
 name="order[pay_type]">
 <option value="">Select a payment method</option>
 <option value="check">Check</option>
 <option value="credit card">Credit card</option>
 <option value="purchase order">Purchase order</option>
 </select>
 </div>
 <PayTypeCustomComponent />
 </div>
);
}
}
export default PayTypeSelector