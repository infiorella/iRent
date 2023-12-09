<%-- 
    Document   : pago
    Created on : 06/11/2020, 03:51:16 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form action="/process_payment" method="post" id="paymentForm">
   <h3>Buyer Details</h3>
     <div>
       <div>
         <label for="email">E-mail</label>
         <input id="email" name="email" type="text" value="test@test.com"></select>
       </div>
       <div>
         <label for="docType">Document Type</label>
         <select id="docType" name="docType" data-checkout="docType" type="text"></select>
       </div>
       <div>
         <label for="docNumber">Document Number</label>
         <input id="docNumber" name="docNumber" data-checkout="docNumber" type="text"/>
       </div>
     </div>
   <h3>Card Details</h3>
     <div>
       <div>
         <label for="cardholderName">Card Holder</label>
         <input id="cardholderName" data-checkout="cardholderName" type="text">
       </div>
       <div>
         <label for="">Expiration Date</label>
         <div>
           <input type="text" placeholder="MM" id="cardExpirationMonth" data-checkout="cardExpirationMonth"
             onselectstart="return false" onpaste="return false"
             oncopy="return false" oncut="return false"
             ondrag="return false" ondrop="return false" autocomplete=off>
           <span class="date-separator">/</span>
           <input type="text" placeholder="YY" id="cardExpirationYear" data-checkout="cardExpirationYear"
             onselectstart="return false" onpaste="return false"
             oncopy="return false" oncut="return false"
             ondrag="return false" ondrop="return false" autocomplete=off>
         </div>
       </div>
       <div>
         <label for="cardNumber">Card Number</label>
         <input type="text" id="cardNumber" data-checkout="cardNumber"
           onselectstart="return false" onpaste="return false"
           oncopy="return false" oncut="return false"
           ondrag="return false" ondrop="return false" autocomplete=off>
       </div>
       <div>
         <label for="securityCode">CVV</label>
         <input id="securityCode" data-checkout="securityCode" type="text"
           onselectstart="return false" onpaste="return false"
           oncopy="return false" oncut="return false"
           ondrag="return false" ondrop="return false" autocomplete=off>
       </div>
       <div id="issuerInput">
         <label for="issuer">Issuer</label>
         <select id="issuer" name="issuer" data-checkout="issuer"></select>
       </div>
       <div>
         <label for="installments">Installments</label>
         <select type="text" id="installments" name="installments"></select>
       </div>
       <div>
         <input type="hidden" name="transactionAmount" id="transactionAmount" value="100" />
         <input type="hidden" name="paymentMethodId" id="paymentMethodId" />
         <input type="hidden" name="description" id="description" />
         <br>
         <button type="submit">Pay</button>
         <br>
       </div>
   </div>
 </form>
