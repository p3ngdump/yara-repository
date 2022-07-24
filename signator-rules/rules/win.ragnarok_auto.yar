rule win_ragnarok_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.ragnarok."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ragnarok"
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
        $sequence_0 = { 034df4 8d8624d14d5c 03c1 8b75bc 8b4da4 c1c00b f7d1 }
            // n = 7, score = 200
            //   034df4               | add                 ecx, dword ptr [ebp - 0xc]
            //   8d8624d14d5c         | lea                 eax, [esi + 0x5c4dd124]
            //   03c1                 | add                 eax, ecx
            //   8b75bc               | mov                 esi, dword ptr [ebp - 0x44]
            //   8b4da4               | mov                 ecx, dword ptr [ebp - 0x5c]
            //   c1c00b               | rol                 eax, 0xb
            //   f7d1                 | not                 ecx

        $sequence_1 = { 8a8090914200 8841fc 83ea01 75ec 43 836df801 75d5 }
            // n = 7, score = 200
            //   8a8090914200         | mov                 al, byte ptr [eax + 0x429190]
            //   8841fc               | mov                 byte ptr [ecx - 4], al
            //   83ea01               | sub                 edx, 1
            //   75ec                 | jne                 0xffffffee
            //   43                   | inc                 ebx
            //   836df801             | sub                 dword ptr [ebp - 8], 1
            //   75d5                 | jne                 0xffffffd7

        $sequence_2 = { 0fb688bd000000 c1e208 0fb689104b4300 33d1 8b4df0 3355fc 3315???????? }
            // n = 7, score = 200
            //   0fb688bd000000       | movzx               ecx, byte ptr [eax + 0xbd]
            //   c1e208               | shl                 edx, 8
            //   0fb689104b4300       | movzx               ecx, byte ptr [ecx + 0x434b10]
            //   33d1                 | xor                 edx, ecx
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   3355fc               | xor                 edx, dword ptr [ebp - 4]
            //   3315????????         |                     

        $sequence_3 = { 8b7db0 23c2 0bc8 81c724d14d5c 034dec 8bc3 8b5dac }
            // n = 7, score = 200
            //   8b7db0               | mov                 edi, dword ptr [ebp - 0x50]
            //   23c2                 | and                 eax, edx
            //   0bc8                 | or                  ecx, eax
            //   81c724d14d5c         | add                 edi, 0x5c4dd124
            //   034dec               | add                 ecx, dword ptr [ebp - 0x14]
            //   8bc3                 | mov                 eax, ebx
            //   8b5dac               | mov                 ebx, dword ptr [ebp - 0x54]

        $sequence_4 = { 0bc8 034de4 8d86dcbc1b8f 8b75b4 03c1 8b4dac c1c00f }
            // n = 7, score = 200
            //   0bc8                 | or                  ecx, eax
            //   034de4               | add                 ecx, dword ptr [ebp - 0x1c]
            //   8d86dcbc1b8f         | lea                 eax, [esi - 0x70e44324]
            //   8b75b4               | mov                 esi, dword ptr [ebp - 0x4c]
            //   03c1                 | add                 eax, ecx
            //   8b4dac               | mov                 ecx, dword ptr [ebp - 0x54]
            //   c1c00f               | rol                 eax, 0xf

        $sequence_5 = { 7449 56 6800080000 6a01 53 e8???????? }
            // n = 6, score = 200
            //   7449                 | je                  0x4b
            //   56                   | push                esi
            //   6800080000           | push                0x800
            //   6a01                 | push                1
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_6 = { 034df8 81c3dcbc1b8f 03d9 897da8 }
            // n = 4, score = 200
            //   034df8               | add                 ecx, dword ptr [ebp - 8]
            //   81c3dcbc1b8f         | add                 ebx, 0x8f1bbcdc
            //   03d9                 | add                 ebx, ecx
            //   897da8               | mov                 dword ptr [ebp - 0x58], edi

        $sequence_7 = { 899df4f7ffff 6690 0fb696104b4300 8bc2 2480 0fb6c8 f7d9 }
            // n = 7, score = 200
            //   899df4f7ffff         | mov                 dword ptr [ebp - 0x80c], ebx
            //   6690                 | nop                 
            //   0fb696104b4300       | movzx               edx, byte ptr [esi + 0x434b10]
            //   8bc2                 | mov                 eax, edx
            //   2480                 | and                 al, 0x80
            //   0fb6c8               | movzx               ecx, al
            //   f7d9                 | neg                 ecx

        $sequence_8 = { 8bc8 2345a4 f7d1 234d9c 0bc8 c145980a 034dfc }
            // n = 7, score = 200
            //   8bc8                 | mov                 ecx, eax
            //   2345a4               | and                 eax, dword ptr [ebp - 0x5c]
            //   f7d1                 | not                 ecx
            //   234d9c               | and                 ecx, dword ptr [ebp - 0x64]
            //   0bc8                 | or                  ecx, eax
            //   c145980a             | rol                 dword ptr [ebp - 0x68], 0xa
            //   034dfc               | add                 ecx, dword ptr [ebp - 4]

        $sequence_9 = { 50 e8???????? 8bc6 c1e002 50 8b85b0f8ffff 0fb704852cd64200 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bc6                 | mov                 eax, esi
            //   c1e002               | shl                 eax, 2
            //   50                   | push                eax
            //   8b85b0f8ffff         | mov                 eax, dword ptr [ebp - 0x750]
            //   0fb704852cd64200     | movzx               eax, word ptr [eax*4 + 0x42d62c]

    condition:
        7 of them and filesize < 483328
}