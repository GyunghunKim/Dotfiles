# Linux

- Since July, 2020. 

### TODO
- `vim` is a language. [Ref](https://johngrib.github.io/wiki/two-views-of-vim/).
- polybar: 한/영, 달력, 시계, 배터리, 소리, 밝기, 팝업 메뉴?
- tex: 한글 입력 가능한지 실험. Snippet 및 문법 익숙해지기. (이제 시작임.)

## Bootloader
- At least of **200MB** is required for bootloaders of `windows 10` and `Arch
  Linux`, and for `GRUB`.
- Just copy the whole boot partition into the root partition. **BE CAREFUL**
  with the bootloaders. 

## Installation Process
- Mainly refer to the [Arch
  Wiki](https://wiki.archlinux.org/index.php/installation_guide).
- Install `wpa_supplicant`, `dhcpcd`, and `sudo`. 
- Add any main user but the root by `useradd -m -G wheel -g users USERNAME`.

## Wifi settings
- 설치 과정에서는 `iwctl`으로 쉽게 Wifi 연결 가능. (`help`!!)
- 설치 과정에서 `wpa_supplicant` / `dhcpcd` 설치.
- `ip addr`로 interface 이름 확인
- `wpa_cli` 이용해서 `wpa_supplicant.conf` 파일 만들기. (Arch wiki 참고.)
- `cp /etc/wpa_supplicant/wpa_supplicant.conf
  /etc/wpa_supplicant/wpa_supplicant-wlp2s0.conf` 이용해서 해당 인터페이스
  specific한 환경 만들기.
- `systemctl enable --now dhcpcd`
- `systemctl enable --now wpa_supplicant@wlp2s0.service`
- ssid가 unicode일 경우에는 `ssid=HEX` 이용할 것. (Google for unicode for hex
  converter online.) 또한 `wpa_passphrase` 이용해서 conf 파일 직접 얻어낼 수
  있음. 이 경우 `wpa_cli` 필요 없음.

## 설치해야할 패키지 (생각나는 대로, 빠져있을 수 있음.)
- `neofetch` *이게 왜 멋진걸까??*
- networks: `net-tools`, `iw` (optional), `wpa_supplicant`, `dhcpcd`
- terminal: `termite` (괜찮은 듯. rxvt-unicode를 쓰기에는 너무 부족함.)
- windows:	`xorg-server`, `xorg-xinit`, `bspwm`, `sxhkd`, `nitrogen`, `dmenu`,
  `firefox`
- fonts 및 한글 설정 :
  [link](https://dgkim5360.tistory.com/entry/basic-setup-of-korean-environment-for-arch-linux)
  초기 설정은 따라가되 `scim` 말고 `ibus` 및 `ibus-hangul` 설치할 것.
- `pywal` 및 실행과정은 pywal github 참고.
- `base-devel` (`makepkg -is` 이용해서 AUR의 패키지들 설치할 때 필요함.)
- `vim`
- `tex-most`
- `zathura` 및 관련 패키지 (`Zathura`는 각 file type별로 plugin이 필요함.)

## Dotfiles 사용법
- `git` 이용해서 clone 한 뒤에 `ln -la .??* ~`을 이용해 디렉토리의 모든
  dotfiles를 홈 디렉토리로 hard link 해주기.
- `.??*`을 하는 이유는 현재 폴더 `.`와 상위 폴더 `..`를 없애주기 위함임.
- 홈 디렉토리에서 .git, READMD.md, .gitignore 삭제하기.  ### TODO
- Scipt the whole process of backup and restoration.

## X-windows
- `.bash_profile`에 `startx`를 이용한 초기 실행 설정.
- `.xinitrc`에서 `bspwm`을 실행할 때 `bspwm &` 하면 안 되고 `exec bspwm` 해야
  함.

## 한글 입력 관련
- `ibus` 및 `ibus-hangul` 설치하기.
- `.bashrc` 에 있는 네 줄 설정 참고. `dmenu`와 충돌 발생하므로 설정 건들면 안
  됨.
- `ibus`의 초기 단축키가 super+@space이므로 `dmenu`와 충돌 발생하는 것.  따라서
  `ibus`의 입력은 korean의 Hangul로 바꾸고, 단축키는 그냥 없애버리면 됨. 이후에
  `ibus-hangul`에서 shift+@space로 수정하기.

## Theme
- `nitrogen`: `nitrogen ~/wallpaper/` 후 `.xinitrc` 설정대로 작동.
- mr. castel (https://castel.dev/) 1번 글의 댓글 참고. `pywal`과 관련.

## Polybar
- `polybar`: Available from `AUR`. (I can not understand why..)
- 날씨 표현: `ntfd`모듈 활용. (.xinitrc에서 실행하고자 하는 프로그램들을 bspwm
  위에 넣어주어야 함.)
- 특정 bar에서 사용하는 글씨체를 모두 설치해야 함. 설치는 `AUR` 이용하고, 설치
  후 `fc-cache` 및 `fc-list | grep (FONT_NAME)` 이용하여 설치 이름 확인하기. 	

## Brightness
- The backlight brightness can be modified by the package named `brightnessctl`.
  The only thing you have to do is install the package. The shortcut to change
  brightness is `super+d` (darker) and `super+b` (brighter).  Please refer to
  the setting file of `sxhkd` for more details.

## Sound
- You need to install `sof-firmware` to use the soundcard installed on the
  Lenovo laptop. Also, `alsa-utils` looks apparent to be required. Finally,
  don't forget to use `alsamixer` to raise the default volume of the speaker as
  maximum.  The settings about the shortcuts are all in `sxhkd` configuration
  file, as always.

## Nvidia graphic drivers
- The `nvidia` and `nvndia-utils` need to be installed. `cuda` is of course
  required for developing cuda programs.
  > However, the version of 455.28 has
  some bugs on cuda with linux kernel version of \>=5.9. Thus, we need to wait
  for November 2020, as noticed, to test the cuda working on the arch.  Note
  that the version lower than this is not available due to lack of support to
  kernel version >= 5.8 and unavailable old versions of `nvidia-utils` which
  cause the version mismatch error. (This problem has been solved at the latest
  version of `nvidia`.)

## Remote control with VNC

- `x0vncserver` helps to share the screen directly. `.xinitrc` contains the line
for running the daemon.
- Change options for `getty@tty1` via `systemctl edit getty@tty1`, following
[Arch
Wiki](https://wiki.archlinux.org/index.php/getty#Automatic_login_to_virtual_console).
- Follow the initial setting for `tigervnc` following
[Here](https://wiki.archlinux.org/index.php/TigerVNC)
- **Security issues need to be considered.**

## vim
- ctags
    - ctags 관련하여 vim 오류 발생할 때는 `ctags` 패키지 설치하기.

- vimtex
    - `.vimrc`에 `filetype plugin on` 필요함.

- ultisnips
    - https://github.com/SirVer/Ultisnips
    - `:UltisnipsEdit filetype` 입력하여 특정 filetype의 snippet 수정 가능.

- instant-markdown-d
    - `instant-markdown-d` `npm` 패키지 설치 필요. *vim 패키지 아님! (vim
      패키지는 필요 없음*
    - firefox 옵션 조절 통해 자동 종료 가능하게 할 수 있음.
    - 완전히 새로운 창에 띄우기 위해서
      `/usr/lib/node_modules/instant-markdown-d/instant-markdown-d` 들어가서
      `xdg-open` 부분 `firefox -new-window`로 직접 바꿔주어야 함.

- ycm (YouCompleteMe)
    - [Installation
      Reference](https://ycm-core.github.io/YouCompleteMe/#linux-64-bit)
    - install `clang`, `libidn11`, `go`, `mono`, `nodejs`, and `npm` with
      pacman. (Something might be missing; just install whatever he wants.)
    - do not use the `python3` from `anaconda`. Manually refer to
      `/usr/bin/python3 install.py --all` to walkaround this problem.
    - `<C-p>` and `<C-n>` navigates the recommendations.
    - `<leader>jd` is mapped to GoTo command of `ycm`. `<C-o>` and `<C-i>` allow
      jumps between multiple reference. 
