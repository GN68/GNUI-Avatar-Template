this avatar is a template for creating UIs with GNUI in a Figura avatar. follow the instructions bellow on trying to use GNUI in your avatar.

> [!CAUTION]
> This library is still in development, expect bugs, use with caution!

> [!NOTE]
> This avatar works as a demo of GNUI, feel free to tinker with it!

# Installation
## No Git
you can simply clone the repository and copy the contents of the `lib/GNUI` folder into your project
> [!WARNING]
> doing this method will mean youll have to copy the `lib/GNUI` folder every time you want to update GNUI

## Inserting into a pre-existing project
```sh
git submodule add -b "v5.x" https://github.com/lua-gods/GNUI lib/GNUI
```

to update the module, you can run
```sh
git submodule update --init --recursive lib/GNUI
```