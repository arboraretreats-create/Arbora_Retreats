import os
import shutil

source_map = {
    r"C:\Users\DELL\Downloads\logo-transparent.png": r"public\images\logo-transparent.png",
    r"C:\Users\DELL\Downloads\pure-arch-tree-mark.png": r"public\images\pure-arch-tree-mark.png",
    r"C:\Users\DELL\Downloads\Chukki Talkies.png": r"public\images\chukki-talkies.png",
    r"C:\Users\DELL\Downloads\Aditya Manjunath.png": r"public\images\team\aditya-manjunath.png",
    r"C:\Users\DELL\Downloads\Sumana Sarkar.png": r"public\images\team\sumana-sarkar.png",
    r"C:\Users\DELL\Downloads\Shashank.png": r"public\images\team\shashank.png",
    r"C:\Users\DELL\Downloads\Mobile Devices\HarshaJanardhanaGiri.png": r"public\images\team\harsha-janardhana-giri.png",
    r"C:\Users\DELL\Downloads\Kavya M.png": r"public\images\team\kavya-m.png",
    r"C:\Users\DELL\Downloads\TribeAway\Varenda.png.jpeg": r"public\images\properties\varenda.jpeg",
    r"C:\Users\DELL\Downloads\lake view .jpeg": r"public\images\properties\lake-view.jpeg",
    r"C:\Users\DELL\Downloads\TribeAway\Dinning.png.jpeg": r"public\images\properties\dining.jpeg",
    r"C:\Users\DELL\Downloads\TribeAway\Camp Fire.png.jpeg": r"public\images\properties\campfire.jpeg",
    r"C:\Users\DELL\Downloads\TribeAway\Private Room.png.jpeg": r"public\images\properties\private-room.jpeg",
    r"C:\Users\DELL\Downloads\TribeAway\Dormitary Room.png.jpeg": r"public\images\properties\dormitary-room.jpeg",
}

fallback_logo = r"public\logo-mark-transparent.png"

for src, dst in source_map.items():
    dst_dir = os.path.dirname(dst)
    if not os.path.exists(dst_dir):
        os.makedirs(dst_dir, exist_ok=True)
    
    if os.path.exists(src):
        shutil.copy2(src, dst)
        print(f"Copied {src} -> {dst} ({os.path.getsize(dst)} bytes)")
    else:
        if os.path.exists(fallback_logo):
            shutil.copy2(fallback_logo, dst)
            print(f"Fallback used for {src} -> {dst} ({os.path.getsize(dst)} bytes)")
        else:
            print(f"WARNING: Source {src} and fallback not found!")

