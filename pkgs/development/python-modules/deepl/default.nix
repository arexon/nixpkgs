{
  lib,
  buildPythonPackage,
  fetchPypi,
  requests,
  poetry-core,
  keyring,
}:

buildPythonPackage rec {
  pname = "deepl";
  version = "1.22.0";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6wlWjlmW3/aiwxjUCiK9Z9P88E8uwrGvmFuNS2zwlrY=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    requests
    keyring
  ];

  # Requires internet access and an API key
  doCheck = false;

  pythonImportsCheck = [ "deepl" ];

  meta = with lib; {
    description = "Language translation API that allows other computer programs to send texts and documents to DeepL's servers and receive high-quality translations";
    mainProgram = "deepl";
    homepage = "https://github.com/DeepLcom/deepl-python";
    changelog = "https://github.com/DeepLcom/deepl-python/blob/v${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ MaskedBelgian ];
  };
}
