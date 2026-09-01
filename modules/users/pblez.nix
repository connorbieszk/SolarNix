{
users.users.pblez = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
   };

   preservation.preserveAt."/persistent".users.pblez = {
        directories = [
           ".ssh"
           ".mozilla"
           "Projects"
         ];

         files = [ ];
   }
}
