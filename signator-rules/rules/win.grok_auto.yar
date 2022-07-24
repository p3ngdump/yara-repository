rule win_grok_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.grok."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.grok"
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
        $sequence_0 = { 8b95d8fdffff 8995d4fdffff 83bdd4fdffff00 0f8433030000 8d8538feffff 8985d0fdffff 8b4d14 }
            // n = 7, score = 400
            //   8b95d8fdffff         | mov                 edx, dword ptr [ebp - 0x228]
            //   8995d4fdffff         | mov                 dword ptr [ebp - 0x22c], edx
            //   83bdd4fdffff00       | cmp                 dword ptr [ebp - 0x22c], 0
            //   0f8433030000         | je                  0x339
            //   8d8538feffff         | lea                 eax, [ebp - 0x1c8]
            //   8985d0fdffff         | mov                 dword ptr [ebp - 0x230], eax
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]

        $sequence_1 = { 8bfb 395dfc 0f8480000000 3bfb 747c a1???????? }
            // n = 6, score = 400
            //   8bfb                 | mov                 edi, ebx
            //   395dfc               | cmp                 dword ptr [ebp - 4], ebx
            //   0f8480000000         | je                  0x86
            //   3bfb                 | cmp                 edi, ebx
            //   747c                 | je                  0x7e
            //   a1????????           |                     

        $sequence_2 = { 5b 58 50 53 51 8b4d08 }
            // n = 6, score = 400
            //   5b                   | pop                 ebx
            //   58                   | pop                 eax
            //   50                   | push                eax
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_3 = { 6a0c eb1b 837d1002 eb0d 837d0c01 0f8584010000 395d10 }
            // n = 7, score = 400
            //   6a0c                 | push                0xc
            //   eb1b                 | jmp                 0x1d
            //   837d1002             | cmp                 dword ptr [ebp + 0x10], 2
            //   eb0d                 | jmp                 0xf
            //   837d0c01             | cmp                 dword ptr [ebp + 0xc], 1
            //   0f8584010000         | jne                 0x18a
            //   395d10               | cmp                 dword ptr [ebp + 0x10], ebx

        $sequence_4 = { 8b4304 a801 0f84a6000000 8b03 3bc7 0f8497000000 0f8ec7000000 }
            // n = 7, score = 400
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   a801                 | test                al, 1
            //   0f84a6000000         | je                  0xac
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   3bc7                 | cmp                 eax, edi
            //   0f8497000000         | je                  0x9d
            //   0f8ec7000000         | jle                 0xcd

        $sequence_5 = { 8b55fc 66833c425c 7506 41 3b4dec 7408 40 }
            // n = 7, score = 400
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   66833c425c           | cmp                 word ptr [edx + eax*2], 0x5c
            //   7506                 | jne                 8
            //   41                   | inc                 ecx
            //   3b4dec               | cmp                 ecx, dword ptr [ebp - 0x14]
            //   7408                 | je                  0xa
            //   40                   | inc                 eax

        $sequence_6 = { 0f8466010000 837d0c00 0f845c010000 837d1400 0f8452010000 56 ff15???????? }
            // n = 7, score = 400
            //   0f8466010000         | je                  0x16c
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   0f845c010000         | je                  0x162
            //   837d1400             | cmp                 dword ptr [ebp + 0x14], 0
            //   0f8452010000         | je                  0x158
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_7 = { 895df0 66895ddc 66895dde 895de0 ffd6 8b3d???????? 8d45dc }
            // n = 7, score = 400
            //   895df0               | mov                 dword ptr [ebp - 0x10], ebx
            //   66895ddc             | mov                 word ptr [ebp - 0x24], bx
            //   66895dde             | mov                 word ptr [ebp - 0x22], bx
            //   895de0               | mov                 dword ptr [ebp - 0x20], ebx
            //   ffd6                 | call                esi
            //   8b3d????????         |                     
            //   8d45dc               | lea                 eax, [ebp - 0x24]

        $sequence_8 = { 33ff 47 3bc3 8945fc 0f8c9c000000 391d???????? 7410 }
            // n = 7, score = 400
            //   33ff                 | xor                 edi, edi
            //   47                   | inc                 edi
            //   3bc3                 | cmp                 eax, ebx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   0f8c9c000000         | jl                  0xa2
            //   391d????????         |                     
            //   7410                 | je                  0x12

        $sequence_9 = { 8b4508 8b08 894dfc 8b55fc 0fb702 3dff250000 755a }
            // n = 7, score = 400
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   0fb702               | movzx               eax, word ptr [edx]
            //   3dff250000           | cmp                 eax, 0x25ff
            //   755a                 | jne                 0x5c

    condition:
        7 of them and filesize < 84992
}