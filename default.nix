{ lib, python311Packages, fetchFromGitHub, fetchgit }: 

python311Packages.buildPythonPackage rec {
  pname = "mcap-protobuf-support";
  version = "1.0.0";
  format="pyproject";
  src_repo = fetchgit {
    url = "https://github.com/foxglove/mcap.git";
    rev = "675d0e4fd2c64ddd58aa9791854092ae9cb79750";  # Specify the specific commit, tag, or branch
    sha256 = "sha256-mW3TCYcfTTEVWIFVcvrfBukjKCYZuz7bJy1XBAzbUyI=";  # SHA256 hash of the source
  };

  # Extract the specific subdirectory within the repository
  propagatedBuildInputs = [  python311Packages.setuptools ];
  src = src_repo + "/python/mcap-protobuf-support";  # Adjust the path to your desired subdirectory

  meta = with lib; {
    description = "Description of your package";
    license = licenses.mit;
  };
} 