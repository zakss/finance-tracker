<%= form_with url: search_stocks_path, method: "get", local: true do %>
  <%= text_field_tag :stock %>
  <%= text_field_tag :shares %>
  <% submit_tag "Search" %>

<% end%>
