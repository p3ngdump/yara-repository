rule win_electric_powder_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.electric_powder."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.electric_powder"
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
        $sequence_0 = { 8bd0 8b7dc4 2bfa 7428 8d55d8 83f910 }
            // n = 6, score = 100
            //   8bd0                 | mov                 edx, eax
            //   8b7dc4               | mov                 edi, dword ptr [ebp - 0x3c]
            //   2bfa                 | sub                 edi, edx
            //   7428                 | je                  0x2a
            //   8d55d8               | lea                 edx, [ebp - 0x28]
            //   83f910               | cmp                 ecx, 0x10

        $sequence_1 = { 3bfb 7edd 83c8ff 85c0 7831 8b1cc53c514300 6a55 }
            // n = 7, score = 100
            //   3bfb                 | cmp                 edi, ebx
            //   7edd                 | jle                 0xffffffdf
            //   83c8ff               | or                  eax, 0xffffffff
            //   85c0                 | test                eax, eax
            //   7831                 | js                  0x33
            //   8b1cc53c514300       | mov                 ebx, dword ptr [eax*8 + 0x43513c]
            //   6a55                 | push                0x55

        $sequence_2 = { 890a 8806 e9???????? 837e4c00 0f843e010000 8bce e8???????? }
            // n = 7, score = 100
            //   890a                 | mov                 dword ptr [edx], ecx
            //   8806                 | mov                 byte ptr [esi], al
            //   e9????????           |                     
            //   837e4c00             | cmp                 dword ptr [esi + 0x4c], 0
            //   0f843e010000         | je                  0x144
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_3 = { c645fc00 85c0 0f84b4000000 8bf0 3bb520efffff 7419 0f1f8000000000 }
            // n = 7, score = 100
            //   c645fc00             | mov                 byte ptr [ebp - 4], 0
            //   85c0                 | test                eax, eax
            //   0f84b4000000         | je                  0xba
            //   8bf0                 | mov                 esi, eax
            //   3bb520efffff         | cmp                 esi, dword ptr [ebp - 0x10e0]
            //   7419                 | je                  0x1b
            //   0f1f8000000000       | nop                 dword ptr [eax]

        $sequence_4 = { 0f871c230000 52 50 e8???????? 83c408 c78560fdffff00000000 c78564fdffff0f000000 }
            // n = 7, score = 100
            //   0f871c230000         | ja                  0x2322
            //   52                   | push                edx
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   c78560fdffff00000000     | mov    dword ptr [ebp - 0x2a0], 0
            //   c78564fdffff0f000000     | mov    dword ptr [ebp - 0x29c], 0xf

        $sequence_5 = { 83c40c 83ffff 75b7 8b551c 83fa10 7240 8b4d08 }
            // n = 7, score = 100
            //   83c40c               | add                 esp, 0xc
            //   83ffff               | cmp                 edi, -1
            //   75b7                 | jne                 0xffffffb9
            //   8b551c               | mov                 edx, dword ptr [ebp + 0x1c]
            //   83fa10               | cmp                 edx, 0x10
            //   7240                 | jb                  0x42
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_6 = { 8d8d68fdffff e9???????? 8d8dd8fcffff e9???????? 8d8d78f9ffff e9???????? }
            // n = 6, score = 100
            //   8d8d68fdffff         | lea                 ecx, [ebp - 0x298]
            //   e9????????           |                     
            //   8d8dd8fcffff         | lea                 ecx, [ebp - 0x328]
            //   e9????????           |                     
            //   8d8d78f9ffff         | lea                 ecx, [ebp - 0x688]
            //   e9????????           |                     

        $sequence_7 = { 837a1410 8bca 7202 8b0a 8b5210 3bd7 755e }
            // n = 7, score = 100
            //   837a1410             | cmp                 dword ptr [edx + 0x14], 0x10
            //   8bca                 | mov                 ecx, edx
            //   7202                 | jb                  4
            //   8b0a                 | mov                 ecx, dword ptr [edx]
            //   8b5210               | mov                 edx, dword ptr [edx + 0x10]
            //   3bd7                 | cmp                 edx, edi
            //   755e                 | jne                 0x60

        $sequence_8 = { 3db7000000 7520 33c0 8b4df4 64890d00000000 59 }
            // n = 6, score = 100
            //   3db7000000           | cmp                 eax, 0xb7
            //   7520                 | jne                 0x22
            //   33c0                 | xor                 eax, eax
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx

        $sequence_9 = { 85db 0f8cce000000 57 8b7d0c 0f8eb3000000 8b4120 8b00 }
            // n = 7, score = 100
            //   85db                 | test                ebx, ebx
            //   0f8cce000000         | jl                  0xd4
            //   57                   | push                edi
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   0f8eb3000000         | jle                 0xb9
            //   8b4120               | mov                 eax, dword ptr [ecx + 0x20]
            //   8b00                 | mov                 eax, dword ptr [eax]

    condition:
        7 of them and filesize < 565248
}