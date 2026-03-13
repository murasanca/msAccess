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
- DPI circumvention for restricted networks.
- AdGuard DNS integration (with ad, tracker, and malware blocking).
- Multiple Windows binaries for quick testing across network environments.
- Lightweight single-folder distribution for macOS.
- Simple run modes intended for different compatibility and performance trade-offs.

## ⚙️ How It Works
- **Packet Fragmentation and Manipulation:** DPI systems often rely on inspecting packet headers and payloads to detect restricted traffic. msAccess modifies packet patterns (e.g., window sizes and fragmentation) to confuse DPI mechanisms while keeping connections valid.
- **DNS Redirection via AdGuard:** Instead of using the ISP's DNS (which may censor or inject results), msAccess enforces DNS queries to be resolved through AdGuard's secure DNS infrastructure. This provides:
  - **Windows:** Direct resolution through AdGuard's DNS server (94.140.14.14).
  - **macOS:** Encrypted DNS-over-HTTPS queries sent to `https://dns.adguard-dns.com/dns-query`.
- **Ad Blocking:** Because msAccess routes DNS requests through AdGuard, all connections automatically benefit from AdGuard's blocklists, filtering ads, trackers, and malicious domains before they reach the client.
- **Fail-Safe Local Proxy:** msAccess sets local proxy rules to ensure traffic flows through its filtering mechanism. On reboot, these settings persist, which is why disabling them manually may be necessary if msAccess is not running.

## 🔀 Windows: Multiple Run Profiles
The single `msAccess.exe` has been replaced with nine distinct executables. Each executable represents a preconfigured behavior profile tuned for different environments and DNS/DPI characteristics. This allows you to try multiple approaches quickly without changing command-line options.

**Default:** `msAccess9.exe` — the most current, generally recommended profile for broad compatibility and performance on modern networks.

| Executable     | Behaviour Summary |
|----------------|-------------------|
| `msAccess1.exe` | Legacy-compatible profile. Conservative transformations and heuristics designed to maximize success on older or strict DPI deployments. Prioritizes compatibility over speed. |
| `msAccess2.exe` | Compatibility-focused profile with slightly higher throughput compared to `msAccess1`. Useful where legacy avoidance is required but performance still matters. |
| `msAccess3.exe` | Balanced profile for mixed HTTP/HTTPS environments. Moderate fragmentation and header adjustments for broader site compatibility. |
| `msAccess4.exe` | Performance-first legacy profile. Uses fewer compatibility tricks and targets faster connections where basic circumvention is sufficient. |
| `msAccess5.exe` | Modern profile tuned for stable, low-latency operation on contemporary networks. Uses automatic distance/TTL adjustments and safer fragmentation ordering. |
| `msAccess6.exe` | Modern profile that prefers sequence-based obfuscation for networks that tolerate reordered segments. Useful when `msAccess5` is insufficient. |
| `msAccess7.exe` | Modern profile that uses checksum and packet anomalies (where supported) to evade DPI. Intended for networks where other approaches fail. |
| `msAccess8.exe` | Aggressive modern profile combining sequence and checksum techniques for maximum obfuscation. May be less compatible with some middleboxes. |
| `msAccess9.exe` | Default modern profile. Combines multiple modern techniques for the best balance of compatibility, stability, and speed on current networks. Recommended as the first test. |

> ⚠️ Note: Because networks and DPI systems differ widely, there is no single profile that always performs best. Start with the default (`msAccess9.exe`). If you experience issues, test other executables in ascending order (for example: 5 → 8 → 7 → 6 → 3 → 2 → 1) to determine which profile works best on your network.

## ⚙️ How the Profiles Differ (High Level)
Each profile is a curated combination of:
- Packet fragmentation and ordering strategies (how and when payloads are split).
- Header-case and host header manipulations to avoid simple string-matching checks.
- Small timing and TTL heuristics that influence how intermediate devices treat forged or fake packets.
- Safe versus aggressive checksum and sequence techniques (some techniques may be dropped or altered by certain routers or virtualized environments).

Profiles that use more aggressive techniques can be more effective against advanced DPI systems, but they are also more likely to cause incompatibilities with poorly implemented middleboxes or proxied connections. For that reason, the profiles are distributed as separate executables so they can be tested quickly without altering configuration lines.

## 📥 Installation
### Windows
1. Download `msAccess.zip` from the [Releases](https://github.com/murasanca/msAccess/releases) page.
2. Extract the archive.
3. Run the desired `msAccess*.exe` file as Administrator.

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