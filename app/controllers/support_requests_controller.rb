 class SupportRequestsController < ApplicationController
 def index
 @support_requests = SupportRequest.all
 end

 end

 <ul>
 <% @support_requests.each do |support_request| %>
 <li>
 <h1>
 On <%= support_request.created_at.to_formatted_s(:long) %>
 <code><%= support_request.email %></code> writes:
 </h1>
 <p>
 <blockquote>
 <h2><%= support_request.subject %></h2>
 <%= support_request.body %>
 </blockquote>
 </p>
 <% if support_request.order %>
 <h3>Recent Order</h3>
 <dl>
 <dt>Name</dt>
 <dd><%= support_request.order.name %></dd>

 <dt>Email</dt>
 <dd><%= support_request.order.email %></dd>

 <dt>Address</dt>
 <dd><%= support_request.order.address %></dd>

 <dt>PayType</dt>
 <dd><%= support_request.order.pay_type %></dd>

 <dt>Line Items</dt>
 <dd>
 <ul>
 <% support_request.order.line_items.each do |line_item| %>
 <li>
 <%= line_item.product.title %>
 (<%= line_item.product.price %>)
 </li>
 <% end %>
 </ul>
 </dd>
 </dl>
 <% else %>
 <h3 class="notice">No associated order</h3>
 <% end %>
 <hr>
 </li>
 <% end %>
 </ul>