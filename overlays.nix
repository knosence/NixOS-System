
{
    cura = self: super: {
        cura = super.cura.overrideAttrs (oldAttrs: rec {
            version = "5.6.0";
            src = super.fetchurl {
                url = "https://github.com/Ultimaker/Cura/releases/download/v${version}/Ultimaker_Cura-${version}-linux.AppImage";
                sha256 = "sha256-hash-of-the-appimage";
            };
        });
    };
}
