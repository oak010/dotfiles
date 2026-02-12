if status is-interactive
# Commands to run in interactive sessions can go here
end
function clean
    echo "⚙️  Initiating Guntank Maintenance Sequence..."
    
    # 1. Clean Package Cache (เก็บไว้ 2 เวอร์ชันล่าสุด เผื่อ Rollback)
    echo "📦 [1/3] Cleaning System Cache (Safety Mode)..."
    sudo paccache -rk2
    
    # 2. Remove Uninstalled Cache (ลบ Cache ของโปรแกรมที่เลิกใช้แล้วทิ้งให้เกลี้ยง)
    # อันนี้มาแทน paru -Sc ที่ error ครับ
    echo "🧹 [2/3] Removing Uninstalled Packages Cache..."
    sudo paccache -ruk0
    
    # 3. Clear System Logs & Trash
    echo "📜 [3/3] Vacuuming Logs & Flush RAM..."
    sudo journalctl --vacuum-time=7d
    
    # 4. Flush RAM (แก้เครื่องอืด)
    sync; echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null
    
    echo "✅ Systems Green. Guntank is Clean & Ready!"
end
zoxide init fish | source
