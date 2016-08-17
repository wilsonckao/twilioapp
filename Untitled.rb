
    <nav class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>



<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  <a class="navbar-brand">SendCom</a>

  <ul class="nav navbar-nav">
    <li><%= link_to "About", pages_about_path %></li>
    <li><%= link_to "Contact", pages_contact_path %></li>
  </ul>

  <ul class="nav navbar-nav navbar-right">
      <% if user_signed_in? %>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Seller Account <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><%= link_to "Manage Listings", seller_path %></li>
            <li><%= link_to "Sales History", sales_path %></li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">User Menu<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><%= link_to "Purchase History", purchases_path %></li>
            <li><%= link_to "Edit Profile", edit_user_registration_path %></li>
            <li><%= link_to "Sign Out", destroy_user_session_path, method: :delete %></li>
          </ul>
        </li>
      <% else %>
        <li><%= link_to "Sign Up", new_user_registration_path %></li>
        <li><%= link_to "Sign In", new_user_session_path %></li>
      <% end %>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>



<div class="twilio">
<%= form_tag('/send_sms', method: 'POST') do %>
<input type="text" placeholder="enter number" name="number">
<input type="text" placeholder="enter message here" name="message">
<button type="submit">Submit</button>
</div>

<%= yield %>


<% end %>
