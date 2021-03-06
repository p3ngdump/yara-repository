rule win_lock_pos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.lock_pos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lock_pos"
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
        $sequence_0 = { 55 8bec 8b4508 8b0d???????? 8b0481 }
            // n = 5, score = 400
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b0d????????         |                     
            //   8b0481               | mov                 eax, dword ptr [ecx + eax*4]

        $sequence_1 = { 8bec 837d0800 7704 33c0 }
            // n = 4, score = 400
            //   8bec                 | mov                 ebp, esp
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7704                 | ja                  6
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { 55 8bec 81eca4040000 56 }
            // n = 4, score = 300
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81eca4040000         | sub                 esp, 0x4a4
            //   56                   | push                esi

        $sequence_3 = { 50 6a00 6a00 6a23 6a00 ff15???????? 8d8df8fdffff }
            // n = 7, score = 300
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a23                 | push                0x23
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8d8df8fdffff         | lea                 ecx, [ebp - 0x208]

        $sequence_4 = { 8945f4 3bc3 0f8411010000 8d45ec }
            // n = 4, score = 200
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   3bc3                 | cmp                 eax, ebx
            //   0f8411010000         | je                  0x117
            //   8d45ec               | lea                 eax, [ebp - 0x14]

        $sequence_5 = { 51 57 68???????? c645fe00 ff15???????? 8b3d???????? }
            // n = 6, score = 200
            //   51                   | push                ecx
            //   57                   | push                edi
            //   68????????           |                     
            //   c645fe00             | mov                 byte ptr [ebp - 2], 0
            //   ff15????????         |                     
            //   8b3d????????         |                     

        $sequence_6 = { 8b5508 8b02 50 6a08 }
            // n = 4, score = 200
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   50                   | push                eax
            //   6a08                 | push                8

        $sequence_7 = { 3d20bf0200 0f86c0000000 6a0c e8???????? 59 }
            // n = 5, score = 200
            //   3d20bf0200           | cmp                 eax, 0x2bf20
            //   0f86c0000000         | jbe                 0xc6
            //   6a0c                 | push                0xc
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_8 = { 7409 8b45f4 83c004 8945f4 }
            // n = 4, score = 200
            //   7409                 | je                  0xb
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   83c004               | add                 eax, 4
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_9 = { 6a01 e8???????? 50 e8???????? 83c40c 8945c4 837dc400 }
            // n = 7, score = 200
            //   6a01                 | push                1
            //   e8????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8945c4               | mov                 dword ptr [ebp - 0x3c], eax
            //   837dc400             | cmp                 dword ptr [ebp - 0x3c], 0

        $sequence_10 = { 8955ec 8b45ec 8b4dec 83e901 894dec 85c0 }
            // n = 6, score = 200
            //   8955ec               | mov                 dword ptr [ebp - 0x14], edx
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   83e901               | sub                 ecx, 1
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   85c0                 | test                eax, eax

        $sequence_11 = { 8bcf e8???????? c9 c3 33c9 66890c47 }
            // n = 6, score = 200
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   c9                   | leave               
            //   c3                   | ret                 
            //   33c9                 | xor                 ecx, ecx
            //   66890c47             | mov                 word ptr [edi + eax*2], cx

        $sequence_12 = { 894de0 8955e4 8b4528 33c9 8945e8 }
            // n = 5, score = 200
            //   894de0               | mov                 dword ptr [ebp - 0x20], ecx
            //   8955e4               | mov                 dword ptr [ebp - 0x1c], edx
            //   8b4528               | mov                 eax, dword ptr [ebp + 0x28]
            //   33c9                 | xor                 ecx, ecx
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax

    condition:
        7 of them and filesize < 319488
}