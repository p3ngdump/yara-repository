rule win_hdmr_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.hdmr."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hdmr"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { e8???????? 8bc6 c1f805 8b048540d04100 83e61f }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8bc6                 | mov                 eax, esi
            //   c1f805               | sar                 eax, 5
            //   8b048540d04100       | mov                 eax, dword ptr [eax*4 + 0x41d040]
            //   83e61f               | and                 esi, 0x1f

        $sequence_1 = { 8365d800 c745dc05f34000 a1???????? 8d4dd8 33c1 }
            // n = 5, score = 100
            //   8365d800             | and                 dword ptr [ebp - 0x28], 0
            //   c745dc05f34000       | mov                 dword ptr [ebp - 0x24], 0x40f305
            //   a1????????           |                     
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   33c1                 | xor                 eax, ecx

        $sequence_2 = { c1e210 0bc2 b920000000 8bfe f3ab 66ab 803b00 }
            // n = 7, score = 100
            //   c1e210               | shl                 edx, 0x10
            //   0bc2                 | or                  eax, edx
            //   b920000000           | mov                 ecx, 0x20
            //   8bfe                 | mov                 edi, esi
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   803b00               | cmp                 byte ptr [ebx], 0

        $sequence_3 = { 89450c bb10000000 85ff 758f 8bbd6cffffff b920000000 8db578ffffff }
            // n = 7, score = 100
            //   89450c               | mov                 dword ptr [ebp + 0xc], eax
            //   bb10000000           | mov                 ebx, 0x10
            //   85ff                 | test                edi, edi
            //   758f                 | jne                 0xffffff91
            //   8bbd6cffffff         | mov                 edi, dword ptr [ebp - 0x94]
            //   b920000000           | mov                 ecx, 0x20
            //   8db578ffffff         | lea                 esi, [ebp - 0x88]

        $sequence_4 = { 8b502c 6a01 51 8bce ffd2 }
            // n = 5, score = 100
            //   8b502c               | mov                 edx, dword ptr [eax + 0x2c]
            //   6a01                 | push                1
            //   51                   | push                ecx
            //   8bce                 | mov                 ecx, esi
            //   ffd2                 | call                edx

        $sequence_5 = { 56 e8???????? c1f805 56 8d3c8540d04100 }
            // n = 5, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   c1f805               | sar                 eax, 5
            //   56                   | push                esi
            //   8d3c8540d04100       | lea                 edi, [eax*4 + 0x41d040]

        $sequence_6 = { 0f8575ffffff 8bfb b920000000 8db578ffffff }
            // n = 4, score = 100
            //   0f8575ffffff         | jne                 0xffffff7b
            //   8bfb                 | mov                 edi, ebx
            //   b920000000           | mov                 ecx, 0x20
            //   8db578ffffff         | lea                 esi, [ebp - 0x88]

        $sequence_7 = { ffd0 8b45fc 40 8945fc 3b450c 72b8 }
            // n = 6, score = 100
            //   ffd0                 | call                eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   40                   | inc                 eax
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   3b450c               | cmp                 eax, dword ptr [ebp + 0xc]
            //   72b8                 | jb                  0xffffffba

        $sequence_8 = { 8b527c 50 57 8bce ffd2 5f 5e }
            // n = 7, score = 100
            //   8b527c               | mov                 edx, dword ptr [edx + 0x7c]
            //   50                   | push                eax
            //   57                   | push                edi
            //   8bce                 | mov                 ecx, esi
            //   ffd2                 | call                edx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_9 = { 8bce 85c0 7418 8b06 8b9090000000 }
            // n = 5, score = 100
            //   8bce                 | mov                 ecx, esi
            //   85c0                 | test                eax, eax
            //   7418                 | je                  0x1a
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8b9090000000         | mov                 edx, dword ptr [eax + 0x90]

    condition:
        7 of them and filesize < 284672
}