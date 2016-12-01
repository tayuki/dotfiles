if has('gui_macvim')
	set transparency=5" 透明度を指定
	set antialias
	set guioptions-=T" ツールバー非表示
	set guioptions-=r" 右スクロールバー非表示
	set guioptions-=R
	set guioptions-=l" 左スクロールバー非表示
	set guioptions-=L
	set guifont=Osaka-Mono:h14

	set lines=90 columns=120

	"set imdisable" IMを無効化

	set noimdisableactivate

	"フルスクリーンモード	
		set fuoptions=maxvert,maxhorz

	colorscheme desert

	#autocmd GUIEnter * set fullscreen 
endif
