{ vars, config, ... }:
{
  programs.git = {
    enable = true;
    userEmail = config.user.email;
    userName = "vicrdguez";
    extraConfig = {
      pretty = {
        lc = "format:%C(auto)%h%C(reset) %C(white)-%C(reset) %C(italic blue)%ad%C(reset) %C(italic cyan)(%ar)%C(reset)%C(auto)%d%C(reset)%n %C(white)⤷%C(reset) %s %C(241)- %aN <%aE>%C(reset)%n";
        lf = "format:%C(auto)%h%C(reset)%C(auto)%d%C(reset)   %C(italic 239)[P: %p] [T: %t]%C(reset)%n%C(white)Author:%C(reset)   %aN %C(241)<%aE>%C(reset)%n          %C(italic blue)%ad%C(reset) %C(italic cyan)(%ar)%C(reset)%n%C(white)Commit:%C(reset)   %cN %C(241)<%cE>%C(reset)   %C(italic 239)[GPG: %G?% GK]%C(reset)%n          %C(italic blue)%cd%C(reset) %C(italic cyan)(%cr)%C(reset)%w(0,4,4)%n%n%C(bold)%s%C(reset)%n%n%-b%n%n%-N%n";
      };
      format.pretty = "lf";
      push.autoSetupRemote = true;
    };
    aliases = {
      # log
      l = "log --pretty=lc --graph";
      la = "log --pretty=lc --graph --all";
      lg = "log --pretty=lc --graph --branches=* --tags=* --remotes=origin --remotes=upstream";
      # Stash
      sl = "stash list --pretty=rlc";
      # diff
      d = "diff -c";
      # status
      s = "status";
      si = "status --ignored";
      sa = "status --ignored --untracked-files";
      # commit
      c = "commit -e";
      cc = "commit -c";
      # checkout
      co = "checkout";
      cob = "checkout -b";
      # branch
      b = "branch";
      bc = "branch --contains";
      bd = "branch --delete --force";
      bl = "branch -vv";
      # switch
      sw = "switch";
      swc = "switch -c";
      # out
      pu = "push";
      puff = "push --force";
      # in
      p = "pull";
      cl = "clone";
      f = "fetch --tags";
      # merge
      m = "merge";
      ma = "merge --abort";
      mc = "merge --continue";
      # rebase
      r = "rebase";
      ra = "rebase --abort";
      rc = "rebase --continue";
      rq = "rebase --quit";
      rs = "rebase --skip";
      ri = "rebase --interactive";
      # hard reset and clean (unrecoverable)
      nuke = "!git reset --hard HEAD && git clean -fd";
      # w-commands
      which = "branch --all --contains";
      which-tag = "describe --always --contains";
      who = "shortlog --summary --numbered --no-merges";
      whoami = "!echo $(git config --get user.name) '<'$(git config --get user.email)'>'";
      # watch = "!f() { watch -ctn 2 git '${@:-l}'; }; f";
    };
  };
}
