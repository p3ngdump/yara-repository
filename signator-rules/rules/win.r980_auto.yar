rule win_r980_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.r980."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.r980"
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
        $sequence_0 = { 51 ff75d4 8d4dd4 e8???????? 668bc7 8b4df4 }
            // n = 6, score = 200
            //   51                   | push                ecx
            //   ff75d4               | push                dword ptr [ebp - 0x2c]
            //   8d4dd4               | lea                 ecx, [ebp - 0x2c]
            //   e8????????           |                     
            //   668bc7               | mov                 ax, di
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_1 = { 8975ec 8975d8 c745fc00000000 e8???????? c7462800000000 c7462c00000000 8d4e30 }
            // n = 7, score = 200
            //   8975ec               | mov                 dword ptr [ebp - 0x14], esi
            //   8975d8               | mov                 dword ptr [ebp - 0x28], esi
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   e8????????           |                     
            //   c7462800000000       | mov                 dword ptr [esi + 0x28], 0
            //   c7462c00000000       | mov                 dword ptr [esi + 0x2c], 0
            //   8d4e30               | lea                 ecx, [esi + 0x30]

        $sequence_2 = { c745fc09000000 50 8d8d5cffffff e8???????? c745fc0a000000 8b8d68ffffff }
            // n = 6, score = 200
            //   c745fc09000000       | mov                 dword ptr [ebp - 4], 9
            //   50                   | push                eax
            //   8d8d5cffffff         | lea                 ecx, [ebp - 0xa4]
            //   e8????????           |                     
            //   c745fc0a000000       | mov                 dword ptr [ebp - 4], 0xa
            //   8b8d68ffffff         | mov                 ecx, dword ptr [ebp - 0x98]

        $sequence_3 = { ff75c0 e8???????? 57 8d8d1cffffff e8???????? 8d8d6cffffff e8???????? }
            // n = 7, score = 200
            //   ff75c0               | push                dword ptr [ebp - 0x40]
            //   e8????????           |                     
            //   57                   | push                edi
            //   8d8d1cffffff         | lea                 ecx, [ebp - 0xe4]
            //   e8????????           |                     
            //   8d8d6cffffff         | lea                 ecx, [ebp - 0x94]
            //   e8????????           |                     

        $sequence_4 = { 7507 8bce e8???????? 668b4db8 8d45b8 0fb75606 6685c9 }
            // n = 7, score = 200
            //   7507                 | jne                 9
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   668b4db8             | mov                 cx, word ptr [ebp - 0x48]
            //   8d45b8               | lea                 eax, [ebp - 0x48]
            //   0fb75606             | movzx               edx, word ptr [esi + 6]
            //   6685c9               | test                cx, cx

        $sequence_5 = { ff750c 8d5108 c745fc00000000 ff7508 8b4d08 e8???????? 8b4508 }
            // n = 7, score = 200
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   8d5108               | lea                 edx, [ecx + 8]
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_6 = { 7504 33c0 eb05 e8???????? 894314 8b4f24 85c9 }
            // n = 7, score = 200
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb05                 | jmp                 7
            //   e8????????           |                     
            //   894314               | mov                 dword ptr [ebx + 0x14], eax
            //   8b4f24               | mov                 ecx, dword ptr [edi + 0x24]
            //   85c9                 | test                ecx, ecx

        $sequence_7 = { 895de0 885def 897dd4 8b4c3838 85c9 7405 8b01 }
            // n = 7, score = 200
            //   895de0               | mov                 dword ptr [ebp - 0x20], ebx
            //   885def               | mov                 byte ptr [ebp - 0x11], bl
            //   897dd4               | mov                 dword ptr [ebp - 0x2c], edi
            //   8b4c3838             | mov                 ecx, dword ptr [eax + edi + 0x38]
            //   85c9                 | test                ecx, ecx
            //   7405                 | je                  7
            //   8b01                 | mov                 eax, dword ptr [ecx]

        $sequence_8 = { ff7510 83c010 50 e8???????? 84c0 0f842f010000 ff7514 }
            // n = 7, score = 200
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   83c010               | add                 eax, 0x10
            //   50                   | push                eax
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   0f842f010000         | je                  0x135
            //   ff7514               | push                dword ptr [ebp + 0x14]

        $sequence_9 = { 83faff 751e 33c0 c745d407000000 c745d000000000 668945c0 8d45c0 }
            // n = 7, score = 200
            //   83faff               | cmp                 edx, -1
            //   751e                 | jne                 0x20
            //   33c0                 | xor                 eax, eax
            //   c745d407000000       | mov                 dword ptr [ebp - 0x2c], 7
            //   c745d000000000       | mov                 dword ptr [ebp - 0x30], 0
            //   668945c0             | mov                 word ptr [ebp - 0x40], ax
            //   8d45c0               | lea                 eax, [ebp - 0x40]

    condition:
        7 of them and filesize < 3178496
}