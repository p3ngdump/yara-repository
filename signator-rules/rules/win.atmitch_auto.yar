rule win_atmitch_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.atmitch."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.atmitch"
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
        $sequence_0 = { 897c242c e8???????? 83c404 33db 33ed }
            // n = 5, score = 100
            //   897c242c             | mov                 dword ptr [esp + 0x2c], edi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   33db                 | xor                 ebx, ebx
            //   33ed                 | xor                 ebp, ebp

        $sequence_1 = { 0fb7f0 ffd7 83c404 8bf8 57 0fb7d6 52 }
            // n = 7, score = 100
            //   0fb7f0               | movzx               esi, ax
            //   ffd7                 | call                edi
            //   83c404               | add                 esp, 4
            //   8bf8                 | mov                 edi, eax
            //   57                   | push                edi
            //   0fb7d6               | movzx               edx, si
            //   52                   | push                edx

        $sequence_2 = { c60000 83c004 3d???????? 7cf3 }
            // n = 4, score = 100
            //   c60000               | mov                 byte ptr [eax], 0
            //   83c004               | add                 eax, 4
            //   3d????????           |                     
            //   7cf3                 | jl                  0xfffffff5

        $sequence_3 = { 8bcc 89642408 68???????? ff15???????? e8???????? 83c404 }
            // n = 6, score = 100
            //   8bcc                 | mov                 ecx, esp
            //   89642408             | mov                 dword ptr [esp + 8], esp
            //   68????????           |                     
            //   ff15????????         |                     
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_4 = { 8b0e 0fb7412c 83c408 83f809 }
            // n = 4, score = 100
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   0fb7412c             | movzx               eax, word ptr [ecx + 0x2c]
            //   83c408               | add                 esp, 8
            //   83f809               | cmp                 eax, 9

        $sequence_5 = { ff15???????? e8???????? 83c404 8d442408 50 8d4c2414 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8d442408             | lea                 eax, [esp + 8]
            //   50                   | push                eax
            //   8d4c2414             | lea                 ecx, [esp + 0x14]

        $sequence_6 = { 8d4c240c ff15???????? 50 51 8d4c2424 }
            // n = 5, score = 100
            //   8d4c240c             | lea                 ecx, [esp + 0xc]
            //   ff15????????         |                     
            //   50                   | push                eax
            //   51                   | push                ecx
            //   8d4c2424             | lea                 ecx, [esp + 0x24]

        $sequence_7 = { 8d4c2410 ff15???????? 6a0d 8d4c240c ff15???????? }
            // n = 5, score = 100
            //   8d4c2410             | lea                 ecx, [esp + 0x10]
            //   ff15????????         |                     
            //   6a0d                 | push                0xd
            //   8d4c240c             | lea                 ecx, [esp + 0xc]
            //   ff15????????         |                     

        $sequence_8 = { 8b4c2414 890c83 0fb75607 40 3bc2 }
            // n = 5, score = 100
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   890c83               | mov                 dword ptr [ebx + eax*4], ecx
            //   0fb75607             | movzx               edx, word ptr [esi + 7]
            //   40                   | inc                 eax
            //   3bc2                 | cmp                 eax, edx

        $sequence_9 = { 8b4c2408 8b41f4 50 8d4c240c ff15???????? 50 }
            // n = 6, score = 100
            //   8b4c2408             | mov                 ecx, dword ptr [esp + 8]
            //   8b41f4               | mov                 eax, dword ptr [ecx - 0xc]
            //   50                   | push                eax
            //   8d4c240c             | lea                 ecx, [esp + 0xc]
            //   ff15????????         |                     
            //   50                   | push                eax

    condition:
        7 of them and filesize < 73728
}