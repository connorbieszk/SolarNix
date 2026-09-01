{
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "connorbieszk";
        email = "98125183+connorbieszk@users.noreply.github.com";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
    };
  };
}
