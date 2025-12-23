#!/bin/bash

echo "--- Mac環境設定を開始します ---"


###############################################################################
# Dock設定
###############################################################################
echo "Dockの設定を適用中..."

# 画面上の位置を「右」に変更
defaults write com.apple.dock orientation right
# アイコンサイズを変更
defaults write com.apple.dock tilesize -int 52
# ホバーで大きくする
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 72
# 自動的に隠す機能をオンにする
defaults write com.apple.dock autohide -bool true
# 最近使ったアプリをDockに表示しない
defaults write com.apple.dock show-recents -bool false


###############################################################################
# Finder設定
###############################################################################
echo "Finderの設定を適用中..."

# 全てのファイルの拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles true

# ライブラリフォルダを表示する（通常は隠されている）
chflags nohidden ~/Library

# デフォルトの表示形式を「リストビュー」にする（Nlsv）
# アイコン:icnv, リスト:Nlsv, カラム:clmv, カバーフロー:Flwv
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# パスバーを表示（下部に現在のパスを表示）
defaults write com.apple.finder ShowPathbar -bool true

# ステータスバーを表示（下部に空き容量などを表示）
defaults write com.apple.finder ShowStatusBar -bool true

# タイトルバーはフルパスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true

# 検索時は「現在のフォルダ」をデフォルトにする
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# USBやネットワークストレージをデスクトップに表示しない（デスクトップを綺麗に保つ）
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# サイドバーの「最近使ったタグ」を非表示にする
defaults write com.apple.finder ShowRecentTags -bool false

# 拡張子変更時の警告ダイアログを非表示にする
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# 新しいFinderウィンドウでホームディレクトリを開く
defaults write com.apple.finder NewWindowTarget -string "PfHm"


###############################################################################
# その他のUI/UX設定
###############################################################################
echo "その他の設定を適用中..."

# バッテリーの割合（%）を表示（ログアウト/再ログインが必要）
defaults write "{$HOME}/Library/Preferences/ByHost/com.apple.controlcenter.plist" BatteryShowPercentage -bool true

# スクリーンショットの影をなくす
defaults write com.apple.screencapture disable-shadow -bool true

# 保存ダイアログをデフォルトで詳細表示にする
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# 右下のホットコーナー設定を「なし」にする
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

echo "スクリーンショット保存先設定を適用中..."
# スクリーンショットの保存先を ~/Screenshots に変更（フォルダがない場合は作成）
if [ ! -d "${HOME}/Screenshots" ]; then
    mkdir "${HOME}/Screenshots"
fi
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

# 起動音ミュート設定のチェックと適用（sudoなのでパスワードが求められる）
if nvram StartupMute 2>/dev/null | grep -q "%01"; then
    echo "✅ 起動音ミュートは設定済みです (スキップ)"
else
    echo "🔊 起動音ミュート設定を適用します..."
    sudo nvram StartupMute=%01
fi

# ズーム機能のキーボードショートカットを使って拡大縮小
# ※ 「プライバシーとセキュリティ」>「フルディスクアクセス」> ターミナルアプリを登録が必要
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

###############################################################################
# アプリ設定
###############################################################################
echo "アプリの設定を適用中..."

# 標準のテキストエディットを「標準テキスト」モードにする。誤ってリッチテキスト（RTF）での保存を防ぐため
defaults write com.apple.TextEdit RichText -int 0
# ファイルを開くときにリッチテキストではなくUTF-8等の標準テキストとして開く
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4


###############################################################################
# キーボード設定
###############################################################################
echo "キーボードの設定を適用中..."

# キーリピートの速度（KeyRepeat）: 標準は 2 (30ms) , 1 (15ms)
defaults write NSGlobalDomain KeyRepeat -int 2

# リピート開始までの待機時間（InitialKeyRepeat）: 標準の最短は 15 (225ms) 。10 (150ms) に設定可能
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# 押しっぱなし時のアクセント入力（é, ñ 等）を無効
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Fnキーを標準のファンクションキーとして使用（F1を押したらF1として動作）
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# 英字入力中にスペルを自動変換しない
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# 文頭を自動的に大文字にしない
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# スペースバーを2回押してピリオドを入力しない
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# スマートクオート（引用符の勝手な変換）を無効化
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# スマートダッシュ（ハイフンの勝手な変換）を無効化
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


###############################################################################
# トラックパッド設定
###############################################################################
echo "トラックパッドの設定を適用中..."

# タップでクリックを有効化（押し込み不要に）
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# 「強めのクリック（Force Click）」と「触覚フィードバック」を無効化
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ForceSuppressed -bool true

# 「通知センターを表示」を無効
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 0

###############################################################################
# ネットワーク共有設定
###############################################################################
echo "ネットワーク共有設定を適用中..."

# ネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###############################################################################
# 再起動処理
###############################################################################
echo "設定を反映するためにFinderとDockを再起動します..."

for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" > /dev/null 2>&1
done

echo "--- 設定完了しました ---"
echo "これらの変更を完全に適用するには、一度ログアウトするかMacを再起動してください。"


### 手動設定
# 「静音」クリック
# 「スマートズーム」無効
# 「回転」無効
# spotlightショートカットキー無効
