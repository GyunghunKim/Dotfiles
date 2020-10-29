## My Dotfiles and Setting Protocols for Arch Linux

- 2020년 7월 다양한 삽질의 기록.

- ***#TODO***
	- `VIM`은 언어이다. [자료](https://johngrib.github.io/wiki/two-views-of-vim/) 읽어보고 공부하기.
	- polybar: 한/영, 달력, 시계, 배터리, 소리, 밝기, 팝업 메뉴?
	- tex: 한글 입력 가능한지 실험. Snippet 및 문법 익숙해지기. (이제 시작임.)
	- terminal로 달력 및 메일? *왜 그래야 하지?*
	- vim으로 독서 메모? *굳이???*

- Bootloader
	- `Windows 10`와 `Arch Linux`의 bootloader 및 `GRUB` 설치를 위해서는 최소 200MB 필요함.
	- 단순 파일복사로 충분하니 1번 파티션 **절대로!!** 날려먹지 말 것. 

- 설치 과정
	- `sudo` 설치.
	- `useradd -m -G wheel -g users USERNAME`으로 사용자 추가.

- Wifi settings
	- 설치 과정에서는 `iwctl`으로 쉽게 Wifi 연결 가능. (`help`!!)
	- 설치 과정에서 `wpa_supplicant` / `dhcpcd` 설치.
	- `ip addr`로 interface 이름 확인
	- `wpa_cli` 이용해서 `wpa_supplicant.conf` 파일 만들기. (Arch wiki 참고.)
	- `cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant-wlp2s0.conf` 이용해서 해당 인터페이스 specific한 환경 만들기.
	- `systemctl enable --now dhcpcd`
	- `systemctl enable --now wpa_supplicant@wlp2s0.service`
	- SSID가 unicode일 경우에는 `$'한글 SSID'`  이용할 것. 또한 `wpa_passphrase` 이용해서 conf 파일 직접 얻어낼 수 있음. 이 경우 `wpa_cli` 필요 없음.

- 설치해야할 패키지 (생각나는 대로, 빠져있을 수 있음.)
	- `neofetch` *이게 왜 멋진걸까??*
	- Networks: `net-tools`, `iw` (optional), `wpa_supplicant`, `dhcpcd`
	- Terminal: `termite` (괜찮은 듯. rxvt-unicode를 쓰기에는 너무 부족함.)
	- Windows:	`xorg-server`, `xorg-xinit`, `bspwm`, `sxhkd`, `nitrogen`, `dmenu`, `firefox`
	- Fonts 및 한글 설정 : [LINK](https://dgkim5360.tistory.com/entry/basic-setup-of-korean-environment-for-arch-linux) 초기 설정은 따라가되 `scim` 말고 `ibus` 및 `ibus-hangul` 설치할 것.
	- `pywal` 및 실행과정은 pywal github 참고.
	- `base-devel` (`makepkg -is` 이용해서 AUR의 패키지들 설치할 때 필요함.)
	- `vim`
	- `tex-most`
	- `Zathura` 및 관련 패키지 (`Zathura`는 각 file type별로 plugin이 필요함.)

- Dotfiles 사용법
	- `git` 이용해서 clone 한 뒤에 `ln -la .??* ~`을 이용해 디렉토리의 모든 dotfiles를 홈 디렉토리로 hard link 해주기.
	- `.??*`을 하는 이유는 현재 폴더 `.`와 상위 폴더 `..`를 없애주기 위함임.
	- 홈 디렉토리에서 .git, READMD.md, .gitignore 삭제하기.
	- *#TODO: hard link 만들 때 one-line으로 불필요한 파일들은 exclude 하는 법?*

- X-Windows
	- `.bash_profile`에 `startx`를 이용한 초기 실행 설정.
	- `.xinitrc`에서 `bspwm`을 실행할 때 `bspwm &` 하면 안 되고 `exec bspwm` 해야 함.

- 한글 입력 관련
	- `ibus` 및 `ibus-hangul` 설치하기.
	- `.bashrc` 에 있는 네 줄 설정 참고. `dmenu`와 충돌 발생하므로 설정 건들면 안 됨.
	- `ibus`의 초기 단축키가 super+@space이므로 `dmenu`와 충돌 발생하는 것.
	  따라서 `ibus`의 입력은 Korean의 Hangul로 바꾸고, 단축키는 그냥 없애버리면
	  됨. 이후에 `ibus-hangul`에서 shift+@space로 수정하기.

- Theme
	- `Nitrogen`: `nitrogen ~/wallpaper/` 후 `.xinitrc` 설정대로 작동.
	- Mr. Castel (https://castel.dev/) 1번 글의 댓글 참고. `pywal`과 관련.

- Polybar
	- `polybar`: `AUR`에서 설치함.
	- 날씨 표현: `ntfd`모듈 활용. (.xinitrc에서 실행하고자 하는 프로그램들을 bspwm 위에 넣어주어야 함.)
	- 특정 bar에서 사용하는 글씨체를 모두 설치해야 함. 설치는 `AUR` 이용하고, 설치 후 `fc-cache` 및 `fc-list | grep (FONT_NAME)` 이용하여 설치 이름 확인하기. 	

- Brightness
    - The backlight brightness can be modified by the package named
      `brightnessctl`. The only thing you have to do is install the package. The
      shortcut to change brightness is `super+d` (darker) and `super+b` (brighter).
      Please refer to the setting file of `sxhkd` for more details.

- VIM 관련
	- ctags
		- ctags 관련하여 vim 오류 발생할 때는 `ctags` 패키지 설치하기.

	- vimtex
		- `.vimrc`에 `filetype plugin on` 필요함.

	- Ultisnips
		- https://github.com/SirVer/Ultisnips
		- `:UltisnipsEdit filetype` 입력하여 특정 filetype의 snippet 수정 가능.

	- instant-markdown-d
		- `instant-markdown-d` `npm` 패키지 설치 필요. *vim 패키지 아님! (vim 패키지는 필요 없음*
		- Firefox 옵션 조절 통해 자동 종료 가능하게 할 수 있음.
		- 완전히 새로운 창에 띄우기 위해서 `/usr/lib/node_modules/instant-markdown-d/instant-markdown-d` 들어가서 `xdg-open` 부분 `firefox -new-window`로 직접 바꿔주어야 함.
