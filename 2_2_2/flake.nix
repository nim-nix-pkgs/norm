{
  description = ''Nim ORM.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-norm-2_2_2.flake = false;
  inputs.src-norm-2_2_2.owner = "moigagoo";
  inputs.src-norm-2_2_2.ref   = "refs/tags/2.2.2";
  inputs.src-norm-2_2_2.repo  = "norm";
  inputs.src-norm-2_2_2.type  = "github";
  
  inputs."ndb".dir   = "nimpkgs/n/ndb";
  inputs."ndb".owner = "riinr";
  inputs."ndb".ref   = "flake-pinning";
  inputs."ndb".repo  = "flake-nimble";
  inputs."ndb".type  = "github";
  inputs."ndb".inputs.nixpkgs.follows = "nixpkgs";
  inputs."ndb".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-norm-2_2_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-norm-2_2_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}