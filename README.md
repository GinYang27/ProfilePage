# ProfilePage

Our team are working on a new userdashboard in recent sprints. I do the profile part.
1. I used bootstrap to do the layout.
2. As there are lots of differences between mobile and desktop, I made two divs for each and checked if mobile by isMobileService.
3. One interesting thing, profile page can be a public(shown to others and have a contact fun) or private(only for the user itself and have post/delete/edit funs). I distinguish public/private by url: /profile is a private; /profile/XXX is a public, XXX is user ID. I achieved that by: attach-1.
