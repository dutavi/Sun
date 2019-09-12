[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex 3395c46..c733e42 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -56,8 +56,8 @@[m [mGEM[m
       minitest (~> 5.1)[m
       tzinfo (~> 1.1)[m
       zeitwerk (~> 2.1, >= 2.1.8)[m
[31m-    addressable (2.6.0)[m
[31m-      public_suffix (>= 2.0.2, < 4.0)[m
[32m+[m[32m    addressable (2.7.0)[m
[32m+[m[32m      public_suffix (>= 2.0.2, < 5.0)[m
     administrate (0.11.0)[m
       actionpack (>= 4.2, < 6.0)[m
       actionview (>= 4.2, < 6.0)[m
[36m@@ -78,10 +78,10 @@[m [mGEM[m
       erubi (>= 1.0.0)[m
       rack (>= 0.9.0)[m
     bindex (0.8.1)[m
[31m-    bootsnap (1.4.4)[m
[32m+[m[32m    bootsnap (1.4.5)[m
       msgpack (~> 1.0)[m
     builder (3.2.3)[m
[31m-    capybara (3.28.0)[m
[32m+[m[32m    capybara (3.29.0)[m
       addressable[m
       mini_mime (>= 0.1.3)[m
       nokogiri (~> 1.8)[m
[36m@@ -96,7 +96,7 @@[m [mGEM[m
     database_cleaner (1.7.0)[m
     datetime_picker_rails (0.0.7)[m
       momentjs-rails (>= 2.8.1)[m
[31m-    devise (4.7.0)[m
[32m+[m[32m    devise (4.7.1)[m
       bcrypt (~> 3.0)[m
       orm_adapter (~> 0.1)[m
       railties (>= 4.1.0)[m
[36m@@ -115,8 +115,8 @@[m [mGEM[m
     factory_bot_rails (5.0.2)[m
       factory_bot (~> 5.0.2)[m
       railties (>= 4.2.0)[m
[31m-    faker (2.1.2)[m
[31m-      i18n (>= 0.8)[m
[32m+[m[32m    faker (2.2.2)[m
[32m+[m[32m      i18n (~> 1.6.0)[m
     ffi (1.11.1)[m
     foreman (0.64.0)[m
       dotenv (~> 0.7.0)[m
[36m@@ -125,7 +125,7 @@[m [mGEM[m
     globalid (0.4.2)[m
       activesupport (>= 4.2.0)[m
     gravatarify (3.0.0)[m
[31m-    guard (2.15.0)[m
[32m+[m[32m    guard (2.15.1)[m
       formatador (>= 0.2.4)[m
       listen (>= 2.7, < 4.0)[m
       lumberjack (>= 1.0.12, < 2.0)[m
[36m@@ -208,7 +208,7 @@[m [mGEM[m
       railties (>= 3.1)[m
     msgpack (1.3.1)[m
     nenv (0.3.0)[m
[31m-    nio4r (2.4.0)[m
[32m+[m[32m    nio4r (2.5.1)[m
     nokogiri (1.10.4)[m
       mini_portile2 (~> 2.4.0)[m
     notiffany (0.1.3)[m
[36m@@ -216,7 +216,7 @@[m [mGEM[m
       shellany (~> 0.0)[m
     orm_adapter (0.5.0)[m
     parallel (1.17.0)[m
[31m-    parser (2.6.3.0)[m
[32m+[m[32m    parser (2.6.4.0)[m
       ast (~> 2.4.0)[m
     pg (1.1.4)[m
     pry (0.12.2)[m
[36m@@ -227,7 +227,7 @@[m [mGEM[m
     pry-rescue (1.5.0)[m
       interception (>= 0.5)[m
       pry (>= 0.12.0)[m
[31m-    public_suffix (3.1.1)[m
[32m+[m[32m    public_suffix (4.0.1)[m
     puma (3.12.1)[m
     pundit (2.1.0)[m
       activesupport (>= 3.0.0)[m
[36m@@ -334,7 +334,7 @@[m [mGEM[m
       sprockets (>= 2.8, < 4.0)[m
       sprockets-rails (>= 2.0, < 4.0)[m
       tilt (>= 1.1, < 3)[m
[31m-    sassc (2.1.0)[m
[32m+[m[32m    sassc (2.2.0)[m
       ffi (~> 1.9)[m
     sassc-rails (2.1.2)[m
       railties (>= 4.0.0)[m
[36m@@ -387,7 +387,7 @@[m [mGEM[m
     will_paginate (3.1.7)[m
     xpath (3.2.0)[m
       nokogiri (~> 1.8)[m
[31m-    zeitwerk (2.1.9)[m
[32m+[m[32m    zeitwerk (2.1.10)[m
 [m
 PLATFORMS[m
   ruby[m
[1mdiff --git a/app/views/devise/registrations/edit.html.erb b/app/views/devise/registrations/edit.html.erb[m
[1mindex 3cc1844..c64588c 100644[m
[1m--- a/app/views/devise/registrations/edit.html.erb[m
[1m+++ b/app/views/devise/registrations/edit.html.erb[m
[36m@@ -1,7 +1,5 @@[m
[31m-[m
 <%= form_for(resource, as: resource_name, url: registration_path(resource_name), html: { method: :put }) do |f| %>[m
   <%= render "devise/shared/error_messages", resource: resource %>[m
[31m-[m
 <div class="container">[m
   <div class="row">[m
     <div class="col-md-9">[m
[36m@@ -9,7 +7,6 @@[m
         <div class="panel panel-default">[m
           <div class="row">[m
             <div class="col-md-12 lead">[m
[31m-              <i><%= gravatar_tag @user.email, :size => 50 %></i>[m
               <h2>Edit <%= resource_name.to_s.humanize %></h2>[m
               <hr>[m
               <div class="col-md-8" >[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex d6f9fd9..155782a 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -21,7 +21,6 @@[m
           <div class="row">[m
             <div class="col">[m
               <% if user_signed_in? %>[m
[31m-                <%= gravatar_tag current_user.email, :size => 50 %>[m
                 <div class="dropdown">[m
                     <button onclick="myFunction()"><i class="fas fa-caret-down"></i></button>[m
                     <div id="myDropdown" class="dropdown-content">[m
