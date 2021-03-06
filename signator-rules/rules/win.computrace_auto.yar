rule win_computrace_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.computrace."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.computrace"
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
        $sequence_0 = { ff36 ff5610 3bc3 894604 74b7 53 }
            // n = 6, score = 200
            //   ff36                 | push                dword ptr [esi]
            //   ff5610               | call                dword ptr [esi + 0x10]
            //   3bc3                 | cmp                 eax, ebx
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   74b7                 | je                  0xffffffb9
            //   53                   | push                ebx

        $sequence_1 = { 33c0 e8???????? c20400 56 8b742408 ff4668 }
            // n = 6, score = 200
            //   33c0                 | xor                 eax, eax
            //   e8????????           |                     
            //   c20400               | ret                 4
            //   56                   | push                esi
            //   8b742408             | mov                 esi, dword ptr [esp + 8]
            //   ff4668               | inc                 dword ptr [esi + 0x68]

        $sequence_2 = { 53 53 6aff 8d45dc }
            // n = 4, score = 200
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   6aff                 | push                -1
            //   8d45dc               | lea                 eax, [ebp - 0x24]

        $sequence_3 = { ff15???????? a3???????? 8d442414 50 53 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   a3????????           |                     
            //   8d442414             | lea                 eax, [esp + 0x14]
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_4 = { 33ff 897dfc 33db 53 be???????? a1???????? }
            // n = 6, score = 200
            //   33ff                 | xor                 edi, edi
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   33db                 | xor                 ebx, ebx
            //   53                   | push                ebx
            //   be????????           |                     
            //   a1????????           |                     

        $sequence_5 = { 56 e8???????? 33db 395e08 }
            // n = 4, score = 200
            //   56                   | push                esi
            //   e8????????           |                     
            //   33db                 | xor                 ebx, ebx
            //   395e08               | cmp                 dword ptr [esi + 8], ebx

        $sequence_6 = { 83c678 56 e8???????? 5e c20400 56 8b742408 }
            // n = 7, score = 200
            //   83c678               | add                 esi, 0x78
            //   56                   | push                esi
            //   e8????????           |                     
            //   5e                   | pop                 esi
            //   c20400               | ret                 4
            //   56                   | push                esi
            //   8b742408             | mov                 esi, dword ptr [esp + 8]

        $sequence_7 = { 75e2 6a02 56 e8???????? 53 8d45e0 50 }
            // n = 7, score = 200
            //   75e2                 | jne                 0xffffffe4
            //   6a02                 | push                2
            //   56                   | push                esi
            //   e8????????           |                     
            //   53                   | push                ebx
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   50                   | push                eax

        $sequence_8 = { 53 8d8558ffffff 50 8d86583c0000 50 e8???????? }
            // n = 6, score = 200
            //   53                   | push                ebx
            //   8d8558ffffff         | lea                 eax, [ebp - 0xa8]
            //   50                   | push                eax
            //   8d86583c0000         | lea                 eax, [esi + 0x3c58]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_9 = { 753a 3975c4 7430 8975c4 3975cc 7412 }
            // n = 6, score = 200
            //   753a                 | jne                 0x3c
            //   3975c4               | cmp                 dword ptr [ebp - 0x3c], esi
            //   7430                 | je                  0x32
            //   8975c4               | mov                 dword ptr [ebp - 0x3c], esi
            //   3975cc               | cmp                 dword ptr [ebp - 0x34], esi
            //   7412                 | je                  0x14

    condition:
        7 of them and filesize < 73728
}