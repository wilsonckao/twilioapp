<%= form_for(@msg) do |f| %>
    <div class="field">
        <p><%= f.label :to_number %></p>
        <p><%= f.text_field :to_number %></p>
    </div>

    <div class="field">
        <p><%= f.label :body %></p>
        <p><%= f.text_area :body %></p>
    </div>

    <div class="field">
        <a href="javascript:void(0);" id="add_location">Add location to SMS</a>
        <br/>
        &nbsp;
    </div>

    <div class="field">
        <p><%= f.hidden_field :lat %></p>
        <p><%= f.hidden_field :lon %></p>
    </div>

    <div class="submit">
        <%= f.submit %>
    </div>
<% end %>
```
