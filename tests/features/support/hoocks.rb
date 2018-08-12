
#Before do
   #@login = LoginPage.new
    #@dash = DashPage.new
    #@nav = NavBar.new
    #@customer = CustomerPage.new
#end


After('@logout') do
   # Fazer Logout
   #find('#navbar a[data-toggle=dropdown]').click
   #find('a[href$=logout]').click
   @nav.fazer_logout
end