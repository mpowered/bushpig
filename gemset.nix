{
  ast = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      type = "gem";
    };
    version = "2.4.2";
  };
  backport = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xmjljpyx5ly078gi0lmmgkv4y0msxxa3hmv74bzxzp3l8qbn5vc";
      type = "gem";
    };
    version = "1.1.2";
  };
  benchmark = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jvrl7400fv7v2jjri1r7ilj3sri36hzipwwgpn5psib4c9c59c6";
      type = "gem";
    };
    version = "0.1.1";
  };
  bushpig = {
    dependencies = ["connection_pool" "json" "redis" "thor"];
    groups = ["default"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "maglev";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
      version = "1.8";
    } {
      engine = "rbx";
      version = "1.9";
    } {
      engine = "rbx";
      version = "2.0";
    } {
      engine = "rbx";
      version = "2.1";
    } {
      engine = "rbx";
      version = "2.2";
    } {
      engine = "rbx";
      version = "2.3";
    } {
      engine = "rbx";
      version = "2.4";
    } {
      engine = "rbx";
      version = "2.5";
    } {
      engine = "rbx";
      version = "2.6";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.6";
    } {
      engine = "ruby";
      version = "2.6";
    }];
    source = {
      path = ./.;
      type = "path";
    };
    version = "0.1.2";
  };
  coderay = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jvxqxzply1lwp7ysn94zjhh57vc14mcshw1ygw14ib8lhc00lyw";
      type = "gem";
    };
    version = "1.1.3";
  };
  connection_pool = {
    groups = ["default"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "maglev";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
      version = "1.8";
    } {
      engine = "rbx";
      version = "1.9";
    } {
      engine = "rbx";
      version = "2.0";
    } {
      engine = "rbx";
      version = "2.1";
    } {
      engine = "rbx";
      version = "2.2";
    } {
      engine = "rbx";
      version = "2.3";
    } {
      engine = "rbx";
      version = "2.4";
    } {
      engine = "rbx";
      version = "2.5";
    } {
      engine = "rbx";
      version = "2.6";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.6";
    } {
      engine = "ruby";
      version = "2.6";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ffdxhgirgc86qb42yvmfj6v1v0x4lvi0pxn9zhghkff44wzra0k";
      type = "gem";
    };
    version = "2.2.5";
  };
  e2mmap = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0n8gxjb63dck3vrmsdcqqll7xs7f3wk78mw8w0gdk9wp5nx6pvj5";
      type = "gem";
    };
    version = "0.1.0";
  };
  jaro_winkler = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1y8l6k34svmdyqxya3iahpwbpvmn3fswhwsvrz0nk1wyb8yfihsh";
      type = "gem";
    };
    version = "1.5.4";
  };
  json = {
    groups = ["default"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "maglev";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
      version = "1.8";
    } {
      engine = "rbx";
      version = "1.9";
    } {
      engine = "rbx";
      version = "2.0";
    } {
      engine = "rbx";
      version = "2.1";
    } {
      engine = "rbx";
      version = "2.2";
    } {
      engine = "rbx";
      version = "2.3";
    } {
      engine = "rbx";
      version = "2.4";
    } {
      engine = "rbx";
      version = "2.5";
    } {
      engine = "rbx";
      version = "2.6";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.6";
    } {
      engine = "ruby";
      version = "2.6";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01v6jjpvh3gnq6sgllpfqahlgxzj50ailwhj9b3cd20hi2dx0vxp";
      type = "gem";
    };
    version = "2.1.0";
  };
  kramdown = {
    dependencies = ["rexml"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jdbcjv4v7sj888bv3vc6d1dg4ackkh7ywlmn9ln2g9alk7kisar";
      type = "gem";
    };
    version = "2.3.1";
  };
  kramdown-parser-gfm = {
    dependencies = ["kramdown"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0a8pb3v951f4x7h968rqfsa19c8arz21zw1vaj42jza22rap8fgv";
      type = "gem";
    };
    version = "1.1.0";
  };
  method_source = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pnyh44qycnf9mzi1j6fywd5fkskv3x7nmsqrrws0rjn5dd4ayfp";
      type = "gem";
    };
    version = "1.0.0";
  };
  mini_portile2 = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xg1x4708a4pn2wk8qs2d8kfzzdyv9kjjachg2f1phsx62ap2rx2";
      type = "gem";
    };
    version = "2.5.1";
  };
  nokogiri = {
    dependencies = ["mini_portile2" "racc"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19d78mdg2lbz9jb4ph6nk783c9jbsdm8rnllwhga6pd53xffp6x0";
      type = "gem";
    };
    version = "1.11.3";
  };
  parallel = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0055br0mibnqz0j8wvy20zry548dhkakws681bhj3ycb972awkzd";
      type = "gem";
    };
    version = "1.20.1";
  };
  parser = {
    dependencies = ["ast"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pxsi1i5z506xfzhiyavlasf8777h55ab40phvp7pfv9npmd5pnj";
      type = "gem";
    };
    version = "3.0.1.1";
  };
  pry = {
    dependencies = ["coderay" "method_source"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0m445x8fwcjdyv2bc0glzss2nbm1ll51bq45knixapc7cl3dzdlr";
      type = "gem";
    };
    version = "0.14.1";
  };
  racc = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "178k7r0xn689spviqzhvazzvxfq6fyjldxb3ywjbgipbfi4s8j1g";
      type = "gem";
    };
    version = "1.5.2";
  };
  rainbow = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bb2fpjspydr6x0s8pn1pqkzmxszvkfapv0p4627mywl7ky4zkhk";
      type = "gem";
    };
    version = "3.0.0";
  };
  rake = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jcabbgnjc788chx31sihc5pgbqnlc1c75wakmqlbjdm8jns2m9b";
      type = "gem";
    };
    version = "10.5.0";
  };
  redis = {
    groups = ["default"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "maglev";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
      version = "1.8";
    } {
      engine = "rbx";
      version = "1.9";
    } {
      engine = "rbx";
      version = "2.0";
    } {
      engine = "rbx";
      version = "2.1";
    } {
      engine = "rbx";
      version = "2.2";
    } {
      engine = "rbx";
      version = "2.3";
    } {
      engine = "rbx";
      version = "2.4";
    } {
      engine = "rbx";
      version = "2.5";
    } {
      engine = "rbx";
      version = "2.6";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.6";
    } {
      engine = "ruby";
      version = "2.6";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i415x8gi0c5vsiy6ikvx5js6fhc4x80a5lqv8iidy2iymd20irv";
      type = "gem";
    };
    version = "3.3.5";
  };
  regexp_parser = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vg7imjnfcqjx7kw94ccj5r78j4g190cqzi1i59sh4a0l940b9cr";
      type = "gem";
    };
    version = "2.1.1";
  };
  reverse_markdown = {
    dependencies = ["nokogiri"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0w6fv779542vdliq2kmikfhymjv55z8mgzblkfjdy2agl07da9c6";
      type = "gem";
    };
    version = "2.0.0";
  };
  rexml = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08ximcyfjy94pm1rhcx04ny1vx2sk0x4y185gzn86yfsbzwkng53";
      type = "gem";
    };
    version = "3.2.5";
  };
  rubocop = {
    dependencies = ["parallel" "parser" "rainbow" "regexp_parser" "rexml" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0chjr6i0g7frbp7dhi4d83ppf7akkdaw7mcgcwbxd6a9mairafpp";
      type = "gem";
    };
    version = "1.14.0";
  };
  rubocop-ast = {
    dependencies = ["parser"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hx4im1a2qpiwipvsl3fma358ixjp4h0mhj56ichq15xrq709qlf";
      type = "gem";
    };
    version = "1.5.0";
  };
  ruby-progressbar = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02nmaw7yx9kl7rbaan5pl8x5nn0y4j5954mzrkzi9i3dhsrps4nc";
      type = "gem";
    };
    version = "1.11.0";
  };
  solargraph = {
    dependencies = ["backport" "benchmark" "e2mmap" "jaro_winkler" "kramdown" "kramdown-parser-gfm" "parser" "reverse_markdown" "rubocop" "thor" "tilt" "yard"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xrad7amwf3nmdbif566qprk6xvwydxwz0s7arnzpvr01anc9gcl";
      type = "gem";
    };
    version = "0.40.4";
  };
  thor = {
    groups = ["default"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "maglev";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.8";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "1.9";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.0";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.1";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.2";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.3";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.4";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.5";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "maglev";
      version = "2.6";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
    } {
      engine = "rbx";
      version = "1.8";
    } {
      engine = "rbx";
      version = "1.9";
    } {
      engine = "rbx";
      version = "2.0";
    } {
      engine = "rbx";
      version = "2.1";
    } {
      engine = "rbx";
      version = "2.2";
    } {
      engine = "rbx";
      version = "2.3";
    } {
      engine = "rbx";
      version = "2.4";
    } {
      engine = "rbx";
      version = "2.5";
    } {
      engine = "rbx";
      version = "2.6";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.8";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "1.9";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.0";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.1";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.2";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.3";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.4";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.5";
    } {
      engine = "ruby";
      version = "2.6";
    } {
      engine = "ruby";
      version = "2.6";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18yhlvmfya23cs3pvhr1qy38y41b6mhr5q9vwv5lrgk16wmf3jna";
      type = "gem";
    };
    version = "1.1.0";
  };
  tilt = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rn8z8hda4h41a64l0zhkiwz2vxw9b1nb70gl37h1dg2k874yrlv";
      type = "gem";
    };
    version = "2.0.10";
  };
  unicode-display_width = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bilbnc8j6jkb59lrf177i3p1pdyxll0n8400hzqr35vl3r3kv2m";
      type = "gem";
    };
    version = "2.0.0";
  };
  yard = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qzr5j1a1cafv81ib3i51qyl8jnmwdxlqi3kbiraldzpbjh4ln9h";
      type = "gem";
    };
    version = "0.9.26";
  };
}
