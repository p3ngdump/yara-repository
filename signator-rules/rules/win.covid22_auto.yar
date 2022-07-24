rule win_covid22_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.covid22."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.covid22"
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
        $sequence_0 = { ff15???????? 56 68???????? e8???????? 59 59 57 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   56                   | push                esi
            //   68????????           |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   57                   | push                edi

        $sequence_1 = { 89d8 e8???????? 89c3 83fb01 7532 }
            // n = 5, score = 100
            //   89d8                 | mov                 eax, ebx
            //   e8????????           |                     
            //   89c3                 | mov                 ebx, eax
            //   83fb01               | cmp                 ebx, 1
            //   7532                 | jne                 0x34

        $sequence_2 = { 7617 57 ff757c e8???????? 8b457c }
            // n = 5, score = 100
            //   7617                 | jbe                 0x19
            //   57                   | push                edi
            //   ff757c               | push                dword ptr [ebp + 0x7c]
            //   e8????????           |                     
            //   8b457c               | mov                 eax, dword ptr [ebp + 0x7c]

        $sequence_3 = { 83c410 8b4574 3bc3 7407 3818 7503 895d74 }
            // n = 7, score = 100
            //   83c410               | add                 esp, 0x10
            //   8b4574               | mov                 eax, dword ptr [ebp + 0x74]
            //   3bc3                 | cmp                 eax, ebx
            //   7407                 | je                  9
            //   3818                 | cmp                 byte ptr [eax], bl
            //   7503                 | jne                 5
            //   895d74               | mov                 dword ptr [ebp + 0x74], ebx

        $sequence_4 = { 83c001 8bce c1e908 330c9df0904000 0fb618 }
            // n = 5, score = 100
            //   83c001               | add                 eax, 1
            //   8bce                 | mov                 ecx, esi
            //   c1e908               | shr                 ecx, 8
            //   330c9df0904000       | xor                 ecx, dword ptr [ebx*4 + 0x4090f0]
            //   0fb618               | movzx               ebx, byte ptr [eax]

        $sequence_5 = { c21000 8b442404 85c0 7413 ff742408 ff30 }
            // n = 6, score = 100
            //   c21000               | ret                 0x10
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   85c0                 | test                eax, eax
            //   7413                 | je                  0x15
            //   ff742408             | push                dword ptr [esp + 8]
            //   ff30                 | push                dword ptr [eax]

        $sequence_6 = { 395d74 7534 57 e8???????? }
            // n = 4, score = 100
            //   395d74               | cmp                 dword ptr [ebp + 0x74], ebx
            //   7534                 | jne                 0x36
            //   57                   | push                edi
            //   e8????????           |                     

        $sequence_7 = { 395d70 7507 c7457000904000 57 e8???????? ff7570 8bf0 }
            // n = 7, score = 100
            //   395d70               | cmp                 dword ptr [ebp + 0x70], ebx
            //   7507                 | jne                 9
            //   c7457000904000       | mov                 dword ptr [ebp + 0x70], 0x409000
            //   57                   | push                edi
            //   e8????????           |                     
            //   ff7570               | push                dword ptr [ebp + 0x70]
            //   8bf0                 | mov                 esi, eax

        $sequence_8 = { 83e20f 0fb692e0904000 885003 0fb6540c02 }
            // n = 4, score = 100
            //   83e20f               | and                 edx, 0xf
            //   0fb692e0904000       | movzx               edx, byte ptr [edx + 0x4090e0]
            //   885003               | mov                 byte ptr [eax + 3], dl
            //   0fb6540c02           | movzx               edx, byte ptr [esp + ecx + 2]

        $sequence_9 = { 7405 ff7550 ffd6 395d58 7405 ff7558 ffd6 }
            // n = 7, score = 100
            //   7405                 | je                  7
            //   ff7550               | push                dword ptr [ebp + 0x50]
            //   ffd6                 | call                esi
            //   395d58               | cmp                 dword ptr [ebp + 0x58], ebx
            //   7405                 | je                  7
            //   ff7558               | push                dword ptr [ebp + 0x58]
            //   ffd6                 | call                esi

    condition:
        7 of them and filesize < 1955840
}