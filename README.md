# msAccess

`msAccess` is a lightweight, cross-platform DPI (Deep Packet Inspection) circumvention tool designed for Windows and macOS. It introduces an additional layer of privacy and accessibility by integrating **AdGuard DNS**.

## ✨ Key Differences from Similar Projects
Unlike traditional DPI bypass tools, **msAccess**:
- Uses **AdGuard DNS** for secure and private DNS resolution.
  - **Windows:** AdGuard DNS (94.140.14.14)
  - **macOS:** AdGuard DNS-over-HTTPS (https://dns.adguard-dns.com/dns-query)
- Automatically blocks ads, trackers, and phishing domains at the DNS level, leveraging AdGuard’s maintained blocklists ([see documentation](https://adguard-dns.io/public-dns.html)).
- Provides a minimal setup process without requiring deep networking knowledge.
- Offers a silent, persistent run mode with simple one-line commands.

## 🚀 Features
- DPI bypass for restricted networks.
- AdGuard DNS integration (with ad, tracker, and malware blocking).
- Lightweight, single binary distribution.
- Works on both Windows and macOS.
- Optimized for simplicity (ready-to-use commands).

## ⚙️ How It Works
- **Packet Fragmentation & Manipulation:** DPI systems often rely on inspecting packet headers and payloads to detect forbidden traffic. msAccess modifies packet patterns (e.g., window sizes, fragmentation) to confuse DPI mechanisms while keeping connections valid.
- **DNS Redirection via AdGuard:** Instead of using the ISP’s DNS (which may censor or inject results), msAccess enforces DNS queries to be resolved through AdGuard’s secure DNS infrastructure. This provides:
  - **Windows:** direct resolution through AdGuard’s DNS server (94.140.14.14).
  - **macOS:** encrypted DNS-over-HTTPS queries sent to `https://dns.adguard-dns.com/dns-query`.
- **Ad Blocking:** Because msAccess routes DNS requests through AdGuard, all connections automatically benefit from AdGuard’s blocklists, filtering ads, trackers, and malicious domains before they reach the client.
- **Fail-Safe Local Proxy:** msAccess sets local proxy rules to ensure traffic flows through its filtering mechanism. On reboot, these settings persist, which is why disabling them manually may be necessary if msAccess isn’t running.

## 📥 Installation
### Windows
1. Download `msAccess.zip` from [Releases](https://github.com/murasanca/msAccess/releases).
2. Extract and run `msAccess.exe` as Administrator.
3. msAccess will start filtering your traffic with AdGuard DNS (94.140.14.14).

### macOS
1. Download `msAccess.tar` from [Releases](https://github.com/murasanca/msAccess/releases).
2. Extract and keep the `msAccess` folder on Desktop (recommended).

#### To Open for the First Time
1. Open **Terminal**.
2. Paste the following command and press **Enter**:
   ```bash
   nohup /Users/$(whoami)/Desktop/msAccess/msAccess -silent -enable-doh -dns-addr https://dns.adguard-dns.com/dns-query -window-size 9 &>/dev/null & disown
   ```
3. Press **Done**.
4. Go to **System Settings > Privacy & Security > Security > Allow Anyway**.
5. Continue with the **To Open** steps.

#### To Open (subsequent runs)
1. Open **Terminal**.
2. Paste the following command and press **Enter**:
   ```bash
   nohup /Users/$(whoami)/Desktop/msAccess/msAccess -silent -enable-doh -dns-addr https://dns.adguard-dns.com/dns-query -window-size 9 &>/dev/null & disown
   ```
3. Press **Open Anyway**.
4. Close **Terminal**.

> ⚠️ If you restart your computer, you will not have internet access because your local proxy settings will remain active.

#### Recommended Solution with msAccess
Follow the **To Open** steps above.

#### Solution without msAccess
1. Go to **System Settings > Wi-Fi > Details… > Proxies**.
2. Disable both **Web proxy (HTTP)** and **Secure web proxy (HTTPS)**.

## 📜 License
GNU Affero General Public License. See [LICENSE](LICENSE) for details.

## 📚 Resources & Credits
- [GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI)
- [SpoofDPI](https://github.com/xvzc/SpoofDPI)
- [WinDivert](https://github.com/basil00/WinDivert)

---

Developed with ❤️ by [murasanca](https://murasanca.com)